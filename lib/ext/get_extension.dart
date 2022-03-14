
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_eye/res/strings.dart';
import 'package:open_eye/widget/dialog/dialog_common_style.dart';
import 'package:open_eye/widget/dialog/dialog_loading.dart';

/// @description :get 扩展函数
extension GetExtension on GetInterface {
  ///隐藏dialog
  dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  ///显示dialog
  showLoading({String text = ''}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(LoadingDialog(text: text.isEmpty ? "加载中" : text),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: false);
  }

  ///显示公共弹窗
  showCommonDialog({
    String title = '',
    String content = '',
    String negaText = '',
    String posiText = '',
    bool negaVisible = true,
    bool posiVisible = true,
    VoidCallback? negaTap,
    VoidCallback? posiTap,
    backKey = false,
  }) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(
        CommonDialog(
          title: title,
          content: content,
          negaText: negaText.isEmpty ? StringStyles.quit : negaText,
          posiText: posiText.isEmpty ? StringStyles.enter : posiText,
          negaVisible: negaVisible,
          posiVisible: posiVisible,
          negaTap: negaTap,
          posiTap: posiTap,
        ),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: backKey);
  }
}
