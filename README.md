# open_eye

开眼APP：整体项目架构基于Getx搭建，完成路由，依赖注入；网络请求框架基于Retrofit+Dio实现，配合官方JsonSerialize实现解析；封装项目页面多状态（加载中，成功，失败，空数据）；封装列表页面下拉刷新+上拉加载更多等，具体更多内容，请下载项目了解更多

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/1.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/2.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/3.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/4.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/5.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/6.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/7.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/8.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/9.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/10.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/11.png" width="400px">

<img src="https://github.com/WinWang/open_eye/blob/master/screenshot/12.png" width="400px">


有了GetView以后，基本不需要StatefulWidget，依靠Stream驱动的Rx实现双向绑定，直接可以刷新数据
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
      appBar: _createAppBar(context),
      body: _buildBody(context),
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

  ///标题栏title的Widget
  Widget? titleWidget() {}

  ///是否开启加载状态
  bool useLoadSir() => true;

  ///是否展示回退按钮
  bool showBackButton() => true;

  ///showSuccess展示成功的布局
  Widget buildContent(BuildContext context);
}





## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
