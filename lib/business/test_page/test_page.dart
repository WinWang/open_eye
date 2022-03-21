import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/home_page/model/Feed_entity.dart';
import 'package:open_eye/business/home_page/model/ItemList.dart';
import 'package:open_eye/business/home_page/widget/item_home_widget.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/route/router_utils.dart';
import 'package:open_eye/utils/log_utils.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///测试用来跳转多次页面，使用Tag生成Controller，每次产生独立对象---具体类似购物车，视频播放详情等页面多次跳转业务
// ignore: must_be_immutable
class TestPage extends BaseStatelessWidget<TestController> {
  String tagKey;

  TestPage({Key? key, required this.tagKey}) : super(key: key) {
    LogD("获取到的标签>>>>>>>>>>>>>>>>$tagKey");
  }

  ///不使用Binding方式可以重写Controller方法获取controller
  // @override
  // TestController get controller => Get.put(TestController(), tag: tagKey);

  @override
  String? get tag => tagKey;

  @override
  Widget buildContent(BuildContext context) {
    return SizedBox(
      child: RefreshWidget<TestController>(
          controllerTag: tagKey,
          refreshController: controller.refreshController,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHomeWidget(controller.dataList[index], index,
                  controller.swiperController);
            },
            itemCount: controller.dataList.length,
          )),
    );
  }

  @override
  String titleString() => "首页";

  @override
  bool showBackButton() => true;

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

class TestController extends BaseRefreshController<ApiService> {
  RxList<ItemList> dataList = <ItemList>[].obs;
  SwiperController swiperController = SwiperController();
  String date = "";

  @override
  void loadNet() {
    requestPageData();
  }

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void requestPageData({Refresh refresh = Refresh.first}) {
    if (refresh == Refresh.first || refresh == Refresh.pull) {
      date = "";
    }
    httpRequest<FeedEntity>(api.queryFeedData(date, 1), (value) {
      var nextPageUrl = value.nextPageUrl ?? "";
      var split = nextPageUrl.split("?");
      var split2 = split[1];
      var split3 = split2.split("&");
      var split4 = split3[0].split("=");
      date = split4[1];
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      dataList.addAll(value.issueList![0].itemList ?? []);
      hideRefresh(refreshController);
    });
  }
}

class TestBinding implements Bindings {
  String bindingTag;

  TestBinding(this.bindingTag);

  @override
  void dependencies() {
    Get.lazyPut(() => TestController(), tag: bindingTag);
  }
}
