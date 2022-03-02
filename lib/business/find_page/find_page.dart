import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/business/find_page/children_page/category_page.dart';
import 'package:open_eye/business/find_page/children_page/focus_page.dart';
import 'package:open_eye/business/find_page/children_page/topic_page.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/utils/log_utils.dart';
import 'package:open_eye/widget/keep_alive_wrapper.dart';

class FindPage extends BaseStatefulWidget<FindController> {
  const FindPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        _createTabBar(),
        Expanded(
          flex: 1,
          child: KeepAliveWrapper(
            child: PageView(
              controller: controller.pagerController,
              children: controller.pagerList,
              onPageChanged: (index) {
                controller.tabController.index = index;
              },
            ),
          ),
        )
      ],
    );
  }

  /// 创建Tab
  Widget _createTabBar() {
    return TabBar(
      tabs: controller.tabList
          .map((element) => Tab(
                text: element,
              ))
          .toList(),
      labelColor: ColorStyle.color_333333,
      labelStyle: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
      unselectedLabelColor: ColorStyle.color_999999,
      indicatorColor: ColorStyle.color_EA4C43,
      isScrollable: false,
      controller: controller.tabController,
      indicatorWeight: 6.w,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 100.w),
      onTap: (index) {
        controller.pagerController.jumpToPage(index);
      },
    );
  }

  @override
  String titleString() {
    return "发现";
  }

  @override
  bool showBackButton() => false;
}

class FindController extends BaseController with GetTickerProviderStateMixin {
  final List<String> tabList = ["关注", "分类", "专题"];
  late TabController tabController;
  final PageController pagerController = PageController();
  final List<Widget> pagerList = [
    const FocusPage(),
    const CategoryPage(),
    const TopicPage()
  ];

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    LogD("FindPage初始化onResume");
    tabController = TabController(length: tabList.length, vsync: this);
    showSuccess();
  }
}

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => FocusController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => TopicController());
  }
}
