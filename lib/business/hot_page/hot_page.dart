import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/utils/log_utils.dart';

class HotPage extends BaseStatefulWidget<HotController> {
  const HotPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Container();
  }

  @override
  String titleString() {
    return "热门";
  }

  @override
  bool showBackButton() => false;

  @override
  bool useLoadSir() => false;
}

class HotController extends BaseController {
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    LogD("HotPage初始化onResume");
  }
}

class HotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HotController());
  }
}
