import 'package:get/get.dart';
import 'package:open_eye/route/routes.dart';

class RouterUtils {
  ///跳转图片预览
  static void toPreviewPhotoView(String? imageUrl) {
    imageUrl = imageUrl ?? "";
    if (imageUrl.isNotEmpty) {
      Get.toNamed(AppRoutes.photoPreviewPage, arguments: imageUrl);
    }
  }

  ///搜索页面
  static void toSearchPage() {
    Get.toNamed(AppRoutes.searchPage);
  }

  ///跳转投诉详情列表页面
  static void toComplainRecordPage(int? id) {
    Get.toNamed(
        AppRoutes.complainHomePage + AppRoutes.complainMyRecordPage,
        arguments: id);
  }



}
