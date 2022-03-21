import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/find_page/model/Focus_Entity.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';
import 'package:open_eye/business/find_page/widget/item_focus_outer_widget.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/route/router_utils.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///关注页面
// ignore: must_be_immutable
class FocusPage extends BaseStatelessWidget<FocusController> {
  String tagType;

  FocusPage({Key? key, required this.tagType}) : super(key: key);

  @override
  String? get tag {
    return tagType;
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<FocusController>(
        controllerTag: tagType,
        refreshController: controller.refreshController,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ItemFocusOuterWidget(controller.dataList[index]);
          },
          itemCount: controller.dataList.length,
        ));
  }

  @override
  bool showTitleBar() {
    return tagType == "route";
  }

  @override
  String titleString() {
    return "关注";
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

class FocusController extends BaseRefreshController<ApiService> {
  RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;

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
    pageIndex++;
    httpRequest<FocusEntity>(api.queryFocusData(pageIndex), (value) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      dataList.addAll(value.itemList ?? []);
      hideRefresh(refreshController);
    });
  }
}

class FocusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusController(), tag: "route");
    // Get.lazyPut(() => FocusController(), tag: "focus"); //支持
  }
}
