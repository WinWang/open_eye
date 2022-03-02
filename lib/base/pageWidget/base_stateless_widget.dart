import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/mixin/toast/toast_mixin.dart';
import 'package:open_eye/widget/load_state_widget.dart';
import 'package:open_eye/widget/loading_widget.dart';

///常用页面无状态page封装，基本依赖Controller+OBX实现原有State+StatefulWidget效果
abstract class BaseStatelessWidget<T extends BaseController> extends GetView<T>
    with ToastMixin {
  const BaseStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showTitleBar() ? createAppBar(titleString(),showBackButton()) : null,
      body: _buildBody(context),
      drawer: showDrawer() ? createDrawer() : null,
    );
  }

  ///构建侧边栏内容
  Widget createDrawer() {
    return Container();
  }

  ///构建Scaffold-body主体内容
  Widget _buildBody(BuildContext context) {
    if (useLoadSir()) {
      return controller.obx((state) => buildContent(context),
          onLoading: Center(
            child: LoadingWidget(),
          ),
          onError: (error) => createErroWidget(controller, error),
          onEmpty: createEmptyWidget(controller));
    } else {
      return buildContent(context);
    }
  }

  ///是否展示titleBar标题栏
  bool showTitleBar() => true;

  ///侧边栏
  bool showDrawer() => false;

  ///页面标题设置
  String titleString() => "标题";

  ///是否开启加载状态
  bool useLoadSir() => true;

  ///是否展示回退按钮
  bool showBackButton() => true;

  ///showSuccess展示成功的布局
  Widget buildContent(BuildContext context);
}
