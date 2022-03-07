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

class HotPage extends BaseStatefulWidget<HotController> {
  const HotPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        _createTabBar(),
        Expanded(
            child: KeepAliveWrapper(
          child: PageView(
            controller: controller.pagerController,
            children: controller.pagerList,
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
  List<Widget>? appBarActionWidget() {
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
    RankListPage(rankType: "weekly"),
    RankListPage(rankType: "monthly"),
    RankListPage(rankType: "historical"),
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
    Get.lazyPut(() => HotController());
    Get.lazyPut(() => RankListController(), tag: "weekly");
    Get.lazyPut(() => RankListController(), tag: "monthly");
    Get.lazyPut(() => RankListController(), tag: "historical");
  }
}
