import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/business/find_page/model/Focus_Entity.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';
import 'package:open_eye/business/hot_page/widget/item_rank_widget.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///实际复用场景-热门-排行榜
// ignore: must_be_immutable
class RankListPage extends BaseStatefulWidget<RankListController> {
  String rankType;
  String tagType;

  RankListPage({Key? key, required this.rankType, required this.tagType})
      : super(key: key);

  ///动态通过Tag查找Controller-重写tag方法
  @override
  String get tag {
    return tagType + "_" + rankType;
  }

  ///解决动态传参初始化Controller，导致PagerView懒加载失效
  @override
  Widget build(BuildContext context) {
    controller.rankType = rankType;
    return super.build(context);
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<RankListController>(
        controllerTag: tag,
        refreshController: controller.refreshController,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemRankWidget(controller.dataList[index]);
            },
            itemCount: controller.dataList.length));
  }

  @override
  bool showTitleBar() {
    return false;
  }
}

class RankListController extends BaseRefreshController<ApiService> {
  String rankType = "weekly";
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
    httpRequest<FocusEntity>(api.queryRankingData(rankType), (value) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      var itemList = value.itemList;
      if (itemList != null && itemList.isNotEmpty) {
        dataList.addAll(itemList);
      }
      hideRefresh(refreshController, finishLoadMore: true);
    });
  }
}

class RankListBinding extends Bindings {
  @override
  void dependencies() {
    ///放在首页Tab可不写，写时为了单独页面依赖能实现跳转绑定
    Get.lazyPut(() => RankListController(), tag: "route_weekly");
    Get.lazyPut(() => RankListController(), tag: "route_monthly");
    Get.lazyPut(() => RankListController(), tag: "route_historical");
  }
}
