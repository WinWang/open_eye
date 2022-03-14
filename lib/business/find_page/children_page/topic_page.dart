import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/find_page/model/Topic_data_entity.dart';
import 'package:open_eye/business/find_page/model/Topic_entity.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/route/router_utils.dart';
import 'package:open_eye/route/routes.dart';
import 'package:open_eye/utils/log_utils.dart';
import 'package:open_eye/widget/base_network_image.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///专题页面
// ignore: must_be_immutable
class TopicPage extends BaseStatelessWidget<TopicController> {
  String tagType;

  TopicPage({Key? key, required this.tagType}) : super(key: key);

  // @override
  // TopicController get controller {
  //   return Get.put(TopicController(), tag: tagType);
  // }

  @override
  String? get tag {
    return tagType;
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<TopicController>(
        refreshController: controller.refreshController,
        controllerTag: tagType,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 10.w, bottom: 10.w),
                width: double.infinity,
                height: 400.w,
                child: BaseNetworkImage(
                  controller.dataList[index].data?.image ?? "",
                  fit: BoxFit.fitWidth,
                ),
              ),
              onTap: () {
                var id = controller.dataList[index].data?.id ?? -1;
                Map<String, String> map = {};
                map["id"] = "$id";
                Get.toNamed(AppRoutes.topicDetailPage, parameters: map);
              },
            );
          },
          itemCount: controller.dataList.length,
        ));
  }

  @override
  bool showTitleBar() {
    LogD(">>>>>>$tag");
    return tagType == "route";
  }

  @override
  String titleString() {
    return "专题";
  }

  ///搜索按钮
  @override
  List<Widget>? appBarActionWidget(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            RouterUtils.toSearchPage();
          },
          icon: const Icon(Icons.search))
    ];
  }
}

class TopicController extends BaseRefreshController<ApiService> {
  RxList<TopicDataEntity> dataList = <TopicDataEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    LogD(">>>>>>>>>>>>>>初始化日志记录");
    loadNet();
  }

  @override
  void loadNet() {
    requestPageData();
  }

  @override
  void requestPageData({Refresh refresh = Refresh.first}) {
    httpRequest<TopicEntity>(api.queryTopicData(pageIndex), (value) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      var itemList = value.itemList;
      if (itemList != null && itemList.isNotEmpty) {
        dataList.addAll(itemList);
      }
      hideRefresh(refreshController);
    });
  }
}

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopicController(), tag: "route");
  }
}
