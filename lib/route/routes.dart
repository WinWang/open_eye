import 'package:get/get.dart';
import 'package:open_eye/business/common/photo_preview_page.dart';
import 'package:open_eye/business/find_page/children_page/category_page.dart';
import 'package:open_eye/business/find_page/children_page/focus_page.dart';
import 'package:open_eye/business/find_page/children_page/topic_page.dart';
import 'package:open_eye/business/find_page/find_page.dart';
import 'package:open_eye/business/home_page/home_page.dart';
import 'package:open_eye/business/hot_page/hot_page.dart';
import 'package:open_eye/business/main_page/main_page.dart';
import 'package:open_eye/business/mine_page/mine_page.dart';

abstract class AppRoutes {
  static const MAIN_PAGE = "/main_page"; //主页Main
  static const HOME_PAGE = "/home_page"; //首页Tab
  static const FIND_PAGE = "/find_page"; //发现Tab
  static const HOT_PAGE = "/hot_page"; //热门Tab
  static const MINE_PAGE = "/mine_page"; //我的Tab
  static const FOCUS_PAGE = "/focus_page"; //关注页面
  static const CATEGORY_PAGE = "/category_page"; //分类页面
  static const TOPIC_PAGE = "/topic_page"; //专题页面
  static const PHOTO_PREVIEW_PAGE = "/photo_preview_page"; //通用图片预览

  static final routerPages = [
    GetPage(
        name: AppRoutes.MAIN_PAGE,
        page: () => const MainPage(),
        binding: MainBinding()),

    GetPage(
        name: AppRoutes.HOME_PAGE,
        page: () => const HomePage(),
        binding: HomeBinding()),

    GetPage(
        name: AppRoutes.HOT_PAGE,
        page: () => const HotPage(),
        binding: HotBinding()),

    GetPage(
        name: AppRoutes.FIND_PAGE,
        page: () => const FindPage(),
        binding: FindBinding(),
        children: [
          GetPage(
              name: AppRoutes.FOCUS_PAGE,
              page: () => const FocusPage(),
              binding: FocusBinding()),
          GetPage(
              name: AppRoutes.CATEGORY_PAGE,
              page: () => const CategoryPage(),
              binding: CategoryBinding()),
          GetPage(
              name: AppRoutes.TOPIC_PAGE,
              page: () => const TopicPage(),
              binding: TopicBinding())
        ]),
    GetPage(
        name: AppRoutes.MINE_PAGE,
        page: () => const MinePage(),
        binding: MineBinding()),

    ///图片预览页面
    GetPage(
        name: PHOTO_PREVIEW_PAGE,
        transition: Transition.zoom,
        page: () => const PhotoPreviewPage(),
        binding: PhotoPreviewBinding())
  ];
}
