import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:open_eye/base/component/base_component.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/business/find_page/model/Focus_Entity.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';
import 'package:open_eye/http/apiservice/api_service.dart';

import 'item_video_detail_widget.dart';

typedef ItemClickCallback = void Function(String title, String videoUrl);

// ignore: must_be_immutable
class VideoListComponent extends BaseComponent<VideoListController> {
  ItemClickCallback callback;

  VideoListComponent(this.callback, {Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Obx(() => GestureDetector(
              child: ItemVideoDetailWidget(controller.dataList[index],
                  controller.selectIndex.value, index),
              onTap: () {
                if (index == controller.selectIndex.value) {
                  return;
                }
                controller.selectIndex.value = index;
                var playUrl = controller.dataList[index].data?.playUrl ?? "";
                var title = controller.dataList[index].data?.title ?? "";
                callback(title, playUrl);
              },
            ));
      },
      itemCount: controller.dataList.length,
    );
  }
}

class VideoListController extends BaseController<ApiService> {
  String videoId = Get.parameters["videoId"] ?? "";
  RxInt selectIndex = (-1).obs;
  RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    queryVideoDetail();
  }

  void queryVideoDetail() {
    httpRequest<FocusEntity>(api.queryVideoDetail(videoId), (value) {
      var itemList = value.itemList ?? [];
      var tempList = <FocusItemEntity>[];
      for (var element in itemList) {
        if ((element.type ?? "") == "videoSmallCard") {
          tempList.add(element);
        }
      }
      dataList.addAll(tempList);
    });
  }
}
