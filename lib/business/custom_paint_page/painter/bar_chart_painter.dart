import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/utils/log_utils.dart';
import 'package:path_drawing/path_drawing.dart';

class BarChartPainter extends CustomPainter {
  List<double> chartList;
  late Paint barPaint;
  late Paint backPaint;
  late Paint dashLinePaint;
  ui.Image? tagImage;
  double maxValue = 0;
  double minValue = 0;
  double perHeight = 0;
  double perValue = 0;

  bool hasTouchDonw;
  double dx;
  double dy;

  BarChartPainter(
      this.chartList, this.hasTouchDonw, this.dx, this.dy, this.tagImage) {
    ///柱状图画笔
    backPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.w
      ..color = ColorStyle.color_CCCCCC;

    ///背景画笔
    barPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 30.w
      ..color = ColorStyle.color_EA4C43;

    ///虚线画笔
    dashLinePaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.w
      ..color = ColorStyle.color_CCCCCC;

    for (var value in chartList) {
      maxValue = max(value, maxValue);
      minValue = min(value, minValue);
    }
    maxValue = maxValue + maxValue * 0.2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    drawBackground(rect, size, canvas);
    drawBarchart(rect, size, canvas);
    drawSelectValue(size, canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  ///绘制背景
  void drawBackground(Rect rect, Size size, Canvas canvas) {
    //绘制底框
    canvas.drawRect(rect, backPaint);
    //绘制左边刻度
    perValue = (maxValue - minValue) / 4;
    perHeight = (size.height - 20.w) / 4;
    for (int i = 0; i < 5; i++) {
      ///绘制刻度文字
      ui.ParagraphBuilder paragraphBuilder =
          ui.ParagraphBuilder(ui.ParagraphStyle(fontSize: 20.sp))
            ..pushStyle(ui.TextStyle(
                color: ColorStyle.color_666666,
                textBaseline: TextBaseline.ideographic))
            ..addText((perValue * i).toString());
      var paragraph = paragraphBuilder.build()
        ..layout(ui.ParagraphConstraints(width: 80.w));
      canvas.drawParagraph(
          paragraph, Offset(0, size.height - i * perHeight - 20.w));
    }
  }

  ///绘制柱子
  void drawBarchart(Rect rect, Size size, Canvas canvas) {
    var perWidth = size.width / (chartList.length + 1);
    var heightValue = size.height / (maxValue - minValue);
    // LogD("msg>>>>>>>${size.height}");
    for (int i = 0; i < chartList.length; i++) {
      var itemValue = chartList[i];
      var xPosition = perWidth * (i + 1);
      var yPosition = size.height - heightValue * itemValue;
      canvas.drawLine(Offset(xPosition, size.height),
          Offset(xPosition, yPosition), barPaint);
    }
  }

  ///绘制选中数据
  void drawSelectValue(Size size, Canvas canvas) {
    if (hasTouchDonw && dx > 0 && dy > 0) {
      var perWidth = size.width / (chartList.length + 1);
      var index = (dx / perWidth).round(); //理论上应该选中的Bar
      // LogD("选中角标>>>>>>>>>$index");
      var xPosition = index * perWidth;
      var heightValue = size.height / (maxValue - minValue);
      if ((index - 1) > chartList.length - 1 || (index - 1) < 0) {
        return;
      }
      var itemValue = chartList[index - 1];
      var yPosition = size.height - heightValue * itemValue;

      ///绘制选中竖线
      var linePath = Path();
      linePath.moveTo(xPosition, 0);
      linePath.lineTo(xPosition, size.height);
      var dashPathLine =
          dashPath(linePath, dashArray: CircularIntervalList([4, 4]));
      canvas.drawPath(dashPathLine, dashLinePaint);
      //绘制选中背景标签
      if (tagImage != null) {
        var src = Rect.fromLTWH(0, 0, tagImage?.width.toDouble() ?? 0,
            tagImage?.height.toDouble() ?? 0);
        var dsc = Rect.fromLTWH(xPosition - 40.w, yPosition - 60.w, 80.w, 60.w);
        canvas.drawImageRect(tagImage!, src, dsc, dashLinePaint);
        //绘制文字
        ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
            ui.ParagraphStyle(fontSize: 20.sp, textAlign: TextAlign.center))
          ..pushStyle(ui.TextStyle(
              color: ColorStyle.color_111111,
              textBaseline: TextBaseline.ideographic))
          ..addText(itemValue.toString());
        var paragraph = paragraphBuilder.build()
          ..layout(ui.ParagraphConstraints(width: 80.w));
        canvas.drawParagraph(
            paragraph, Offset(xPosition - 40.w, yPosition - 40.w));
      }
    }
  }
}
