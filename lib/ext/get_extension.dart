
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
    String backText = '',
    String nextText = '',
    bool backVisible = true,
    bool nextVisible = true,
    VoidCallback? backTap,
    VoidCallback? nextTap,
    backKey = false,
  }) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(
        CommonDialog(
          title: title,
          content: content,
          backText: backText.isEmpty ? StringStyles.quit : backText,
          nextText: nextText.isEmpty ? StringStyles.enter : nextText,
          backVisible: backVisible,
          nextVisible: nextVisible,
          backTap: backTap,
          nextTap: nextTap,
        ),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: backKey);
  }
}
