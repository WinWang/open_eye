import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/business/hot_page/children_page/rank_list_page.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/route/router_utils.dart';
import 'package:open_eye/utils/log_utils.dart';
import 'package:open_eye/widget/keep_alive_wrapper.dart';

// ignore: must_be_immutable
class HotPage extends BaseStatefulWidget<HotController> {
  String tagType;

  HotPage({Key? key, required this.tagType}) : super(key: key);

  @override
  String? get tag => tagType;

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        _createTabBar(),
        Expanded(
            child: KeepAliveWrapper(
          child: PageView(
            controller: controller.pagerController,
            children: tagType == "home"
                ? controller.pagerList
                : controller.pagerListRoute,
            onPageChanged: (index) {
              controller.tabController.index = index;
            },
          ),
        ))
      ],
    );
  }

  @override
  String titleString() {
    return "热门";
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

  @override
  bool showBackButton() => false;

  @override
  bool useLoadSir() => false;

  /// 创建Tab
  Widget _createTabBar() {
    return Container(
      child: TabBar(
        tabs: controller.tabList
            .map((element) => Tab(
                  text: element,
                ))
            .toList(),
        labelColor: ColorStyle.color_white,
        labelStyle: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
        unselectedLabelColor: ColorStyle.color_CCCCCC,
        indicatorColor: ColorStyle.color_white,
        isScrollable: false,
        controller: controller.tabController,
        indicatorWeight: 6.w,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 100.w),
        onTap: (index) {
          controller.pagerController.jumpToPage(index);
        },
      ),
      color: ColorStyle.color_EA4C43,
    );
  }
}

class HotController extends BaseController with GetTickerProviderStateMixin {
  final List<String> tabList = ["周排行", "月排行", "总排行"];
  late TabController tabController =
      TabController(length: tabList.length, vsync: this);
  final PageController pagerController = PageController();
  final List<Widget> pagerList = [
    RankListPage(rankType: "weekly", tagType: "home"),
    RankListPage(rankType: "monthly", tagType: "home"),
    RankListPage(rankType: "historical", tagType: "home"),
  ];

  final List<Widget> pagerListRoute = [
    RankListPage(rankType: "weekly", tagType: "route"),
    RankListPage(rankType: "monthly", tagType: "route"),
    RankListPage(rankType: "historical", tagType: "route"),
  ];

  @override
  void onReady() {
    super.onReady();
    LogD("HotPage初始化onReady");
  }

  @override
  void loadNet() {}
}

class HotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HotController(), tag: "route");
    Get.lazyPut(() => RankListController(), tag: "route_weekly");
    Get.lazyPut(() => RankListController(), tag: "route_monthly");
    Get.lazyPut(() => RankListController(), tag: "route_historical");
  }
}
