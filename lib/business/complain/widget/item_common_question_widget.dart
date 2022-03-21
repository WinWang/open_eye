import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/strings.dart';
import 'package:open_eye/route/routes.dart';

// ignore: must_be_immutable
class ItemCommonQuestionWidget extends CommonStatelessWidget {
  String? item;

  ItemCommonQuestionWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 88.w,
        width: double.infinity,
        margin: EdgeInsets.only(left: 32.w, right: 32.w),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.w, color: ColorStyle.colorShadow)),
        ),
        child: Row(
          children: [
            Text(
              item ?? "",
              style: TextStyle(
                fontSize: 28.sp,
                color: ColorStyle.color_333333,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 32.w),
          ],
        ),
      ),
      onTap: () {
        Map<String, String> params = {
          "aqTitle": item ?? "",
          "aqDesc": StringStyles.complainAQMap[item] ?? ""
        };
        Get.toNamed(
            AppRoutes.complainHomePage + AppRoutes.complainCommonPage,
            parameters: params);
      },
    );
  }
}
