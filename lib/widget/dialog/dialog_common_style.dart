import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/ext/get_extension.dart';
import 'package:open_eye/res/button_style.dart';
import 'package:open_eye/res/style.dart';
import 'package:open_eye/widget/behavior/over_scroll_behavior.dart';

/// @description :公共通用弹窗
// ignore: must_be_immutable
class CommonDialog extends StatelessWidget {
  ///标题
  String title = '';

  ///内容
  String content = '';

  ///左侧文字
  String negaText = '';

  ///右侧文字
  String posiText = '';

  ///左侧事件
  VoidCallback? negaTap;

  ///右侧事件
  VoidCallback? posiTap;

  ///左侧是否隐藏
  bool negaVisible = true;

  ///右侧是否隐藏
  bool posiVisible = true;

  CommonDialog({
    Key? key,
    this.title = '',
    this.content = '',
    this.negaText = '',
    this.posiText = '',
    this.negaVisible = true,
    this.posiVisible = true,
    this.negaTap,
    this.posiTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

        ///透明样式
        type: MaterialType.transparency,

        ///dialog居中
        child: Center(

            ///取消ListView滑动阴影
            child: ScrollConfiguration(
                behavior: OverScrollBehavior(),

                ///ListView 的shrinkWrap属性可适应高度（有多少占多少）
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ///背景及内容、边距、圆角等，必须包裹在ListView中
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ///标题、内容
                            Box.hBox30,
                            Text(
                              title,
                              style: Styles.style_black_30_bold500,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 30.w),
                              child: Text(
                                content,
                                style: Styles.style_6A6969_28,
                              ),
                            ),
                            DividerStyle.divider1Half,

                            ///确定、取消按钮
                            Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              direction: Axis.horizontal,
                              children: [
                                ///对半分
                                _buildTextButton(
                                    negaTap, negaText, negaVisible),
                                _buildTextButton(posiTap, posiText, posiVisible)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  ///此处使用方法重新创建的原因是因为此处不需要频繁更新，不会造成过度创建
  _buildTextButton(VoidCallback? tap, String text, bool show) {
    return Visibility(
        visible: show,
        child: Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Get.dismiss();
                if (tap != null) {
                  tap();
                }
              },
              style: ButtonStyles.getNoShapeStyle(),
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  text,
                  style: Styles.style_black_32,
                ),
              ),
            )));
  }
}
