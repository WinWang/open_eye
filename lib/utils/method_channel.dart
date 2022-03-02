import 'package:flutter/services.dart';
import 'package:open_eye/constant/common_constant.dart';

import 'log_utils.dart';

var channel = const MethodChannel(CommonConstant.METHOD_CHANNEL);

///获取用户信息原生交互
// Future<UserInfo> getUserInfo() async {
//   var result = await channel.invokeMethod(CommonConstant.METHOD_GET_USER_INFO);
//   LogD("用户信息$result");
//   UserInfo userInfo = UserInfo.fromJson(Map<String, dynamic>.from(result));
//   return userInfo;
// }

///点击顶部会退按钮操作
Future<void> onBackPressed() async {
  await channel.invokeMethod(CommonConstant.METHOD_ON_BACK_PRESSED);
}
