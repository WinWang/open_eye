import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/business/find_page/model/Topic_data_entity.dart';
import 'package:open_eye/business/find_page/model/Topic_entity.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/route/routes.dart';
import 'package:open_eye/utils/log_utils.dart';
import 'package:open_eye/widget/base_network_image.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///专题页面
class TopicPage extends BaseStatefulWidget<TopicController> {
  TopicPage({Key? key}) : super(key: key);

  @override
  String? get tag {
    LogD(">>>>>>>>>>>>>${Get.arguments}");
    return Get.arguments;
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<TopicController>(
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
    return false;
  }

  @override
  String titleString() {
    return "专题";
  }
}

class TopicController extends BaseRefreshController<ApiService> {
  RxList<TopicDataEntity> dataList = <TopicDataEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
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
    Get.lazyPut(() => TopicController());
    Get.lazyPut(() => TopicController(), tag: "topic"); //解决复用页面
  }
}
