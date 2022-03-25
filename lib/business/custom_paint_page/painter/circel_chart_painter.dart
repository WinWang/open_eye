import 'dart:math';

import 'package:flutter/material.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/utils/log_utils.dart';

class CircleChartPainter extends CustomPainter {
  List<double> chartList;
  double totalValue = 0;

  var colorList = [
    ColorStyle.color_EA4C43,
    ColorStyle.color_FE8C28,
    ColorStyle.color_FFAE2E,
    ColorStyle.color_FBE240,
    ColorStyle.color_24CF5F,
    ColorStyle.color_1A2F51,
    ColorStyle.color_EA4C43,
    ColorStyle.color_FE8C28,
    ColorStyle.color_FFAE2E,
    ColorStyle.color_FBE240,
    ColorStyle.color_24CF5F,
    ColorStyle.color_1A2F51,
  ];

  late Paint circlePaint;

  CircleChartPainter(this.chartList) {
    circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorStyle.color_black
      ..isAntiAlias = true;
    for (var value in chartList) {
      totalValue += value;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    ///Android和Flutter一样的API，用的却不同，Android是角度，FLutter需要用弧度，比较坑
    ///弧度 = 角度 * PI/180；
    ///
    ///角度 = 弧度 * 180/PI；
    double startAngle = -90 * pi / 180;
    var percentAngle = 360 / totalValue;
    for (int i = 0; i < chartList.length; i++) {
      var value = chartList[i];
      circlePaint.color = colorList[i];
      var percent = value / totalValue;
      var angel = percentAngle * value * pi / 180;
      LogD("$startAngle角度>>>>>>$angel<<<<<<");
      canvas.drawArc(rect, startAngle, angel, true, circlePaint);
      startAngle += angel;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
