import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/find_page/children_page/category_page.dart';
import 'package:open_eye/business/find_page/children_page/focus_page.dart';
import 'package:open_eye/business/find_page/children_page/topic_page.dart';
import 'package:open_eye/business/find_page/find_page.dart';
import 'package:open_eye/business/home_page/home_page.dart';
import 'package:open_eye/business/hot_page/children_page/rank_list_page.dart';
import 'package:open_eye/business/hot_page/hot_page.dart';
import 'package:open_eye/business/mine_page/mine_page.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/widget/keep_alive_wrapper.dart';

class MainPage extends BaseStatelessWidget<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => WillPopScope(
        child: Scaffold(
          body: KeepAliveWrapper(
            child: PageView(
              controller: controller._pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.naviItems,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller._curPage.value,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: "发现"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department), label: "热门"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
            ],
            fixedColor: ColorStyle.color_EA4C43,
            onTap: (int index) {
              //跳转到指定页面
              controller._pageController.jumpToPage(index);
              controller._curPage.value = index;
            },
          ),
        ),
        onWillPop: () async {
          if (controller.lastPopTime == null ||
              DateTime.now().difference(controller.lastPopTime!) >
                  const Duration(seconds: 2)) {
            // 存储当前按下back键的时间
            controller.lastPopTime = DateTime.now();
            // toast
            showToast("再按一次退出app");
            return false;
          } else {
            controller.lastPopTime = DateTime.now();
            // 退出app
            await SystemNavigator.pop();
            return true;
          }
        }));
  }

  @override
  bool showTitleBar() => false;
}

class MainController extends BaseController {
  DateTime? lastPopTime;
  final RxInt _curPage = 0.obs;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> naviItems = [
    const HomePage(),
    const FindPage(),
    const HotPage(),
    const MinePage()
  ];

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    showSuccess();
  }
}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => HotController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => FocusController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => TopicController());
    Get.lazyPut(() => RankListController(), tag: "weekly");
    Get.lazyPut(() => RankListController(), tag: "monthly");
    Get.lazyPut(() => RankListController(), tag: "historical");
  }
}
