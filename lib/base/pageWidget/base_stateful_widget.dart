import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/mixin/toast/toast_mixin.dart';
import 'package:open_eye/widget/load_state_widget.dart';
import 'package:open_eye/widget/loading_widget.dart';

///具有状态管理的基础页面，满足一些特定需要State的Widget(暂时还未发现需要使用State的场景)
abstract class BaseStatefulWidget<T extends BaseController>
    extends StatefulWidget with ToastMixin {
  const BaseStatefulWidget({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller {
    return GetInstance().find<T>(tag: tag);
  }

  ///Get 局部更新字段
  get updateId => null;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(context),
      body: buildBody(context),
      drawer: showDrawer() ? createDrawer() : null,
    );
  }

  ///AppBar生成逻辑
  AppBar? _createAppBar(BuildContext context) {
    if (showTitleBar()) {
      return createAppBar(
          titleString(), showBackButton(), appBarActionWidget(context),
          titleWidget: titleWidget());
    } else {
      return null;
    }
  }

  ///构建侧边栏内容
  Widget createDrawer() {
    return Container();
  }

  ///创建AppBar ActionView
  List<Widget>? appBarActionWidget(BuildContext context) {}

  ///构建Scaffold-body主体内容
  Widget buildBody(BuildContext context) {
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

  ///标题栏title的Widget
  Widget? titleWidget() {}

  ///是否开启加载状态
  bool useLoadSir() => true;

  ///是否展示回退按钮
  bool showBackButton() => true;

  ///showSuccess展示成功的布局
  Widget buildContent(BuildContext context);

  ///widget生命周期
  get lifecycle => null;

  @override
  State createState() => AutoDisposeState<T>();
}

class AutoDisposeState<T extends GetxController>
    extends State<BaseStatefulWidget>
    with
        AutomaticKeepAliveClientMixin<BaseStatefulWidget>,
        WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<T>(
        tag: widget.tag,
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        });
  }

  @override
  void initState() {
    super.initState();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance?.addObserver(this);
    }
  }

  @override
  void dispose() {
    Get.delete<T>(tag: widget.tag);
    if (widget.lifecycle != null) {
      WidgetsBinding.instance?.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
