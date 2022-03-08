import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

///通用样式提取
class Styles {
  ///---------------------------黑绿色字体区域-------------------------------
  static TextStyle style_1A2F51_14 =
      TextStyle(color: ColorStyle.color_1A2F51, fontSize: 14.sp);
  static TextStyle style_1A2F51_16 =
      TextStyle(color: ColorStyle.color_1A2F51, fontSize: 16.sp);
  static TextStyle style_1A2F51_18 =
      TextStyle(color: ColorStyle.color_1A2F51, fontSize: 18.sp);

  ///---------------------------淡灰色字体区域-------------------------------
  static TextStyle style_B8C0D4_11 =
      TextStyle(color: ColorStyle.color_B8C0D4, fontSize: 11.sp);
  static TextStyle style_B8C0D4_13 =
      TextStyle(color: ColorStyle.color_B8C0D4, fontSize: 13.sp);
  static TextStyle style_B8C0D4_14 =
      TextStyle(color: ColorStyle.color_B8C0D4, fontSize: 14.sp);

  ///---------------------------浅灰色字体区域-------------------------------
  static TextStyle style_9F9EA6_11 =
      TextStyle(color: Color(0xff9F9EA6), fontSize: 11.sp, height: 1.1.sh);
  static TextStyle style_9F9EA6_14 =
      TextStyle(color: Color(0xff9F9EA6), fontSize: 14.sp, height: 1.1.sh);
  static TextStyle style_616169_11 =
      TextStyle(color: Color(0xff616169), fontSize: 11.sp, height: 1.1.sh);
  static TextStyle style_6A6969_14 =
      TextStyle(color: ColorStyle.color_6A6969, fontSize: 14.sp);
  static TextStyle style_6A6969_16 =
      TextStyle(color: ColorStyle.color_6A6969, fontSize: 16.sp);
  static TextStyle style_6A6969_28 =
      TextStyle(color: ColorStyle.color_6A6969, fontSize: 28.sp);
  static TextStyle style_000000_30 =
      TextStyle(color: ColorStyle.color_000000, fontSize: 30.sp);

  ///---------------------------白色字体区域-------------------------------
  static TextStyle style_white_10 =
      TextStyle(color: Colors.white, fontSize: 10.sp, height: 1.1.sh);
  static TextStyle style_white_12 =
      TextStyle(color: Colors.white, fontSize: 12.sp);
  static TextStyle style_white_14 =
      TextStyle(color: Colors.white, fontSize: 14.sp);
  static TextStyle style_white_16 =
      TextStyle(color: Colors.white, fontSize: 16.sp);
  static TextStyle style_white_22 =
      TextStyle(color: Colors.white, fontSize: 22.sp);
  static TextStyle style_white_24 =
      TextStyle(color: Colors.white, fontSize: 24.sp);
  static TextStyle style_white_18 =
      TextStyle(color: Colors.white, fontSize: 18.sp);
  static TextStyle style_white_16_bold = TextStyle(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w700);
  static TextStyle style_white24_18 =
      TextStyle(color: Colors.white24, fontSize: 18.sp);
  static TextStyle style_white_36 =
      TextStyle(color: Colors.white, fontSize: 36.sp);

  static TextStyle style_white_32_bold = TextStyle(
      color: Colors.white, fontSize: 32.sp, fontWeight: FontWeight.bold);

  ///---------------------------黑色字体区域-------------------------------
  static TextStyle style_black_18_bold = TextStyle(
      color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w700);
  static TextStyle style_black_18_bold500 = TextStyle(
      color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500);
  static TextStyle style_black_24_bold500 = TextStyle(
      color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w500);
  static TextStyle style_black_30_bold500 = TextStyle(
      color: Colors.black, fontSize: 30.sp, fontWeight: FontWeight.w500);
  static TextStyle style_black_16_bold = TextStyle(
      color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700);
  static TextStyle style_black_16_bold500 = TextStyle(
      color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500);
  static TextStyle style_black_14 =
      TextStyle(color: Colors.black, fontSize: 14.sp);
  static TextStyle style_black_16 =
      TextStyle(color: Colors.black, fontSize: 16.sp);
  static TextStyle style_black_24 =
      TextStyle(color: Colors.black, fontSize: 24.sp);
  static TextStyle style_black_32 =
      TextStyle(color: Colors.black, fontSize: 32.sp);
  static TextStyle style_black_36 =
      TextStyle(color: Colors.black, fontSize: 36.sp);
  static TextStyle style_black_30 =
      TextStyle(color: Colors.black, fontSize: 30.sp);
  static TextStyle style_black_12 =
      TextStyle(color: Colors.black, fontSize: 12.sp);
  static TextStyle style_black_13 =
      TextStyle(color: Colors.black, fontSize: 13.sp);
  static TextStyle style_black_15 =
      TextStyle(color: Colors.black, fontSize: 15.sp);

  static const TextStyle style_24CF5F_14 =
      TextStyle(color: ColorStyle.color_24CF5F, fontSize: 14);

  ///---------------------------黄色、淡黄色字体区域-------------------------------
  static TextStyle style_FE8C28_24_bold = TextStyle(
      color: ColorStyle.color_FE8C28,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700);

  static TextStyle style_FFAE2E_14 =
      TextStyle(color: ColorStyle.color_FFAE2E, fontSize: 14.sp);

  static TextStyle style_FFAE2E_16 =
      TextStyle(color: ColorStyle.color_FFAE2E, fontSize: 16.sp);

  static TextStyle style_FE8C28_11 = TextStyle(
      color: ColorStyle.color_FE8C28, fontSize: 11.sp, height: 1.1.sh);
}

/// 间隔
class Box {
  /// 水平间隔
  static Widget wBox3 = SizedBox(width: 3.w);
  static Widget wBox4 = SizedBox(width: 4.w);
  static Widget wBox5 = SizedBox(width: 5.w);
  static Widget wBox6 = SizedBox(width: 6.w);
  static Widget wBox7 = SizedBox(width: 7.w);
  static Widget wBox8 = SizedBox(width: 8.w);
  static Widget wBox9 = SizedBox(width: 9.w);
  static Widget wBox10 = SizedBox(width: 10.w);
  static Widget wBox11 = SizedBox(width: 11.w);
  static Widget wBox12 = SizedBox(width: 12.w);
  static Widget wBox13 = SizedBox(width: 13.w);
  static Widget wBox14 = SizedBox(width: 14.w);
  static Widget wBox15 = SizedBox(width: 15.w);
  static Widget wBox16 = SizedBox(width: 16.w);
  static Widget wBox17 = SizedBox(width: 17.w);
  static Widget wBox18 = SizedBox(width: 18.w);
  static Widget wBox19 = SizedBox(width: 19.w);
  static Widget wBox20 = SizedBox(width: 20.w);
  static Widget wBox21 = SizedBox(width: 21.w);
  static Widget wBox22 = SizedBox(width: 22.w);
  static Widget wBox23 = SizedBox(width: 23.w);
  static Widget wBox24 = SizedBox(width: 24.w);
  static Widget wBox25 = SizedBox(width: 25.w);
  static Widget wBox26 = SizedBox(width: 26.w);
  static Widget wBox27 = SizedBox(width: 27.w);
  static Widget wBox28 = SizedBox(width: 28.w);
  static Widget wBox29 = SizedBox(width: 29.w);
  static Widget wBox30 = SizedBox(width: 30.w);
  static Widget wBox31 = SizedBox(width: 31.w);
  static Widget wBox32 = SizedBox(width: 32.w);
  static Widget wBox33 = SizedBox(width: 33.w);
  static Widget wBox34 = SizedBox(width: 34.w);
  static Widget wBox35 = SizedBox(width: 35.w);
  static Widget wBox36 = SizedBox(width: 36.w);
  static Widget wBox37 = SizedBox(width: 37.w);
  static Widget wBox38 = SizedBox(width: 38.w);
  static Widget wBox39 = SizedBox(width: 39.w);
  static Widget wBox40 = SizedBox(width: 40.w);
  static Widget wBox41 = SizedBox(width: 41.w);
  static Widget wBox42 = SizedBox(width: 42.w);
  static Widget wBox43 = SizedBox(width: 43.w);
  static Widget wBox44 = SizedBox(width: 44.w);
  static Widget wBox45 = SizedBox(width: 45.w);
  static Widget wBox46 = SizedBox(width: 46.w);
  static Widget wBox47 = SizedBox(width: 47.w);
  static Widget wBox48 = SizedBox(width: 48.w);
  static Widget wBox49 = SizedBox(width: 49.w);
  static Widget wBox50 = SizedBox(width: 50.w);
  static Widget wBox51 = SizedBox(width: 51.w);
  static Widget wBox52 = SizedBox(width: 52.w);
  static Widget wBox53 = SizedBox(width: 53.w);
  static Widget wBox54 = SizedBox(width: 54.w);
  static Widget wBox55 = SizedBox(width: 55.w);

  /// 水平间隔
  static Widget hBox3 = SizedBox(height: 3.w);
  static Widget hBox4 = SizedBox(height: 4.w);
  static Widget hBox5 = SizedBox(height: 5.w);
  static Widget hBox6 = SizedBox(height: 6.w);
  static Widget hBox7 = SizedBox(height: 7.w);
  static Widget hBox8 = SizedBox(height: 8.w);
  static Widget hBox9 = SizedBox(height: 9.w);
  static Widget hBox10 = SizedBox(height: 10.w);
  static Widget hBox11 = SizedBox(height: 11.w);
  static Widget hBox12 = SizedBox(height: 12.w);
  static Widget hBox13 = SizedBox(height: 13.w);
  static Widget hBox14 = SizedBox(height: 14.w);
  static Widget hBox15 = SizedBox(height: 15.w);
  static Widget hBox16 = SizedBox(height: 16.w);
  static Widget hBox17 = SizedBox(height: 17.w);
  static Widget hBox18 = SizedBox(height: 18.w);
  static Widget hBox19 = SizedBox(height: 19.w);
  static Widget hBox20 = SizedBox(height: 20.w);
  static Widget hBox21 = SizedBox(height: 21.w);
  static Widget hBox22 = SizedBox(height: 22.w);
  static Widget hBox23 = SizedBox(height: 23.w);
  static Widget hBox24 = SizedBox(height: 24.w);
  static Widget hBox25 = SizedBox(height: 25.w);
  static Widget hBox26 = SizedBox(height: 26.w);
  static Widget hBox27 = SizedBox(height: 27.w);
  static Widget hBox28 = SizedBox(height: 28.w);
  static Widget hBox29 = SizedBox(height: 29.w);
  static Widget hBox30 = SizedBox(height: 30.w);
  static Widget hBox31 = SizedBox(height: 31.w);
  static Widget hBox32 = SizedBox(height: 32.w);
  static Widget hBox33 = SizedBox(height: 33.w);
  static Widget hBox34 = SizedBox(height: 34.w);
  static Widget hBox35 = SizedBox(height: 35.w);
  static Widget hBox36 = SizedBox(height: 36.w);
  static Widget hBox37 = SizedBox(height: 37.w);
  static Widget hBox38 = SizedBox(height: 38.w);
  static Widget hBox39 = SizedBox(height: 39.w);
  static Widget hBox40 = SizedBox(height: 40.w);
  static Widget hBox41 = SizedBox(height: 41.w);
  static Widget hBox42 = SizedBox(height: 42.w);
  static Widget hBox43 = SizedBox(height: 43.w);
  static Widget hBox44 = SizedBox(height: 44.w);
  static Widget hBox45 = SizedBox(height: 45.w);
  static Widget hBox46 = SizedBox(height: 46.w);
  static Widget hBox47 = SizedBox(height: 47.w);
  static Widget hBox48 = SizedBox(height: 48.w);
  static Widget hBox49 = SizedBox(height: 49.w);
  static Widget hBox50 = SizedBox(height: 50.w);
  static Widget hBox51 = SizedBox(height: 51.w);
  static Widget hBox52 = SizedBox(height: 52.w);
  static Widget hBox53 = SizedBox(height: 53.w);
  static Widget hBox54 = SizedBox(height: 54.w);
  static Widget hBox55 = SizedBox(height: 55.w);

  static Widget getHGap(double w) {
    return SizedBox(width: w);
  }

  static Widget getVGap(double h) {
    return SizedBox(height: h);
  }
}

class DividerStyle {
  ///分割线 0.5 - 20边距
  static Widget divider1HalfPadding20 = Divider(
    height: 0.5.w,
    thickness: 0.5,
    indent: 20,
    endIndent: 20,
    color: ColorStyle.colorShadow,
  );

  ///分割线 0.5 - 20边距
  static Widget divider2Padding20 = Divider(
    height: 2.w,
    indent: 20,
    endIndent: 20,
    color: ColorStyle.colorShadow2,
  );

  ///分割线 0.5 - 无边距
  static Widget divider1Half = Divider(
    height: 1.w,
    thickness: 0.5,
    color: ColorStyle.colorShadow,
  );

  ///分割线 20 - 无边距
  static Widget divider20Half = const Divider(
    height: 20,
    thickness: 20,
    color: ColorStyle.color_F8F9FC,
  );
}
