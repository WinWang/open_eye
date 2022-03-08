import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/business/find_page/model/Focus_Entity.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';
import 'package:open_eye/business/find_page/widget/item_focus_outer_widget.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/utils/log_utils.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///关注页面
class FocusPage extends BaseStatefulWidget<FocusController> {
  FocusPage({Key? key}) : super(key: key);

  @override
  String? get tag {
    LogD(">>>>>>>>>>>>>${Get.arguments}");
    return Get.arguments;
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<FocusController>(
        child: ListView.builder(
      itemBuilder: (context, index) {
        return ItemFocusOuterWidget(controller.dataList[index]);
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
    return "关注";
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
    Get.lazyPut(() => FocusController());
    Get.lazyPut(() => FocusController(), tag: "focus"); //支持
  }
}
