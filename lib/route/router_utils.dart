import 'package:get/get.dart';
import 'package:open_eye/route/routes.dart';

class RouterUtils {
  ///跳转图片预览
  static void toPreviewPhotoView(String? imageUrl) {
    imageUrl = imageUrl ?? "";
    if (imageUrl.isNotEmpty) {
      Get.toNamed(AppRoutes.PHOTO_PREVIEW_PAGE, arguments: imageUrl);
    }
  }

}
