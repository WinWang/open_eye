import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

mixin DialogMixin {
  ///展示加载DialogLoading
  void showLoadingDialog() {
    Get.dialog(Center(
      child: Image.asset(
        "assets/images/loading/common_loading.png",
        height: 100.w,
        width: 100.w,
      ),
    ));
  }
}
