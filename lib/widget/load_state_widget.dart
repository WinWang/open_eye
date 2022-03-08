import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';

///空布局
Widget createEmptyWidget(BaseController controller) {
  return Material(
    child: Center(
        widthFactor: double.infinity,
        child: GestureDetector(
          onTap: () {
            controller.showLoading();
            controller.loadNet();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/common_empty_img.png",
                height: 320.w,
                width: 320.w,
              ),
              Box.hBox30,
              Text(
                "暂无数据",
                style:
                    TextStyle(fontSize: 32.sp, color: ColorStyle.color_999999),
              ),
              Box.hBox20,
              Text(
                "点我重试",
                style:
                    TextStyle(fontSize: 25.sp, color: ColorStyle.color_999999),
              )
            ],
          ),
        )),
  );
}

///创建AppBar
AppBar createAppBar(
    String titleString, bool showBackButton, List<Widget>? actionWidget,
    {Widget? titleWidget}) {
  return AppBar(
    title: titleWidget ?? titleView(titleString),
    centerTitle: true,
    backgroundColor: ColorStyle.color_EA4C43,
    iconTheme: const IconThemeData(color: ColorStyle.color_white),
    elevation: 0,
    systemOverlayStyle: systemOverLayoutStyle(),
    leading: showBackButton ? leadingButton() : null,
    actions: actionWidget,
  );
}

Widget titleView(String titleString) {
  return Text(
    titleString,
    style: Styles.style_white_32_bold,
  );
}

///回退按钮
Widget leadingButton() {
  return IconButton(
    icon: const Icon(Icons.arrow_back_ios),
    onPressed: () async {
      // onBackPressed();
      var canPop = navigator?.canPop();
      if (canPop != null && canPop) {
        Get.back();
      } else {
        SystemNavigator.pop();
      }
    },
  );
}

Future<void> pop() async {
  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

///状态栏颜色设置
SystemUiOverlayStyle systemOverLayoutStyle() {
  return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorStyle.color_EA4C43,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light);
}

///异常布局
Widget createErroWidget(BaseController controller, String? error) {
  return Material(
      child: Center(
          widthFactor: double.infinity,
          child: GestureDetector(
            onTap: () {
              controller.showLoading();
              controller.loadNet();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/common_empty_img.png",
                  height: 320.w,
                  width: 320.w,
                ),
                Box.wBox30,
                Text(
                  error ?? "页面加载异常",
                  style: TextStyle(
                      fontSize: 32.sp, color: ColorStyle.color_999999),
                ),
                Box.hBox20,
                Text(
                  "点我重试",
                  style: TextStyle(
                      fontSize: 25.sp, color: ColorStyle.color_999999),
                )
              ],
            ),
          )));
}

Widget createCustomHoldreWidget(String? error, BaseController controller) {
  return Material(
      child: Center(
          widthFactor: double.infinity,
          child: GestureDetector(
            onTap: () {
              controller.showLoading();
              controller.loadNet();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/common_empty_img.png",
                  height: 320.w,
                  width: 320.w,
                ),
                Box.wBox30,
                Text(
                  error ?? "页面加载异常",
                  style: TextStyle(
                      fontSize: 32.sp, color: ColorStyle.color_999999),
                ),
                Box.hBox20,
                Text(
                  "点我重试",
                  style: TextStyle(
                      fontSize: 25.sp, color: ColorStyle.color_999999),
                )
              ],
            ),
          )));
}
