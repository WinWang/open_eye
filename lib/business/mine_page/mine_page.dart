import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';
import 'package:open_eye/utils/log_utils.dart';

class MinePage extends BaseStatefulWidget<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/back_mine.png",
                fit: BoxFit.fill,
                height: 500.w,
              ),
              Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/head_mine.jpeg",
                      height: 150.w,
                      width: 150.w,
                    ),
                  ),
                  Box.hBox20,
                  Text(
                    "Flutter",
                    style: TextStyle(
                        fontSize: 32.sp, color: ColorStyle.color_white),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  String titleString() {
    return "我的";
  }

  @override
  bool showTitleBar() {
    return false;
  }
}

class MineController extends BaseController {
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    LogD("Mine初始化onResume");
    showSuccess();
  }
}

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
  }
}
