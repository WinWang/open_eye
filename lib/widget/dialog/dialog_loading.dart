import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/res/style.dart';

/// @description :公共加载弹窗
class LoadingDialog extends StatefulWidget {
  String text = '';

  LoadingDialog({
    Key? key,
    this.text = "加载中...",
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Center(
          //保证控件居中效果
          child: SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: const ShapeDecoration(
                color: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: RotationTransition(
                      child: Image.asset(
                        "assets/images/loading/common_loading.png",
                        height: 100.w,
                        width: 100.w,
                      ),
                      turns: _animController
                        ..addStatusListener((status) {
                          if (status == AnimationStatus.completed) {
                            _animController.reset();
                            _animController.forward();
                          }
                        }),
                    ),
                  ),
                  Text(widget.text, style: Styles.style_white_24),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _animController.dispose(); //解决内存泄漏
    super.dispose();
  }
}
