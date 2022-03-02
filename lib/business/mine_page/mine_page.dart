import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/utils/log_utils.dart';

class MinePage extends BaseStatefulWidget<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Container();
  }

  @override
  String titleString() {
    return "我的";
  }

  @override
  bool showBackButton() => false;
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
