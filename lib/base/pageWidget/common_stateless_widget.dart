import 'package:flutter/material.dart';
import 'package:open_eye/mixin/toast/toast_mixin.dart';

///实现一些基础功能的StatelessWidget(例如Toast等)
abstract class CommonStatelessWidget extends StatelessWidget with ToastMixin {
  const CommonStatelessWidget({Key? key}) : super(key: key);
}
