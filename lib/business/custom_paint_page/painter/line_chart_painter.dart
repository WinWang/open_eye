import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/res/colors.dart';

class LineChartPainter extends CustomPainter {
  List<int> chartList; //数据集
  double dx; //手指触摸的x坐标
  double dy; //手指
  bool hasDown; //是否选中

  LineChartPainter(
      {required this.chartList,
      required this.dx,
      required this.dy,
      required this.hasDown,
      Key? key}) {
    for (var value in chartList) {
      minValue = min(value, minValue);
      maxValue = max(value, maxValue);
    }
  }

  int maxValue = 0;
  int minValue = 0;
  double perHeight = 0;
  double perValue = 0;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    drawBack(canvas, rect, size);
    drawLine(canvas, rect, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void drawBack(Canvas canvas, Rect rect, Size size) {
    ///初始化边框、刻度画笔
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.w
      ..color = ColorStyle.color_CCCCCC;

    ///绘制背景矩形边框
    canvas.drawRect(rect, paint);

    ///绘制刻度文字
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
      // canvas.drawParagraph(paragraph,
      //     Offset(0, i == 0 ? size.height - 20.w : size.height - i * perHeight));

      canvas.drawParagraph(
          paragraph, Offset(0, size.height - i * perHeight - 20.w));
    }
  }

  void drawLine(Canvas canvas, Rect rect, Size size) {
    ///初始化画笔-圆点
    var paintCircle = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = ColorStyle.color_FE8C28;

    ///绘制选中矩形
    var paintRect = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = ColorStyle.color_555555;

    ///初始化画笔-折线
    var paintLine = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.w
      ..color = ColorStyle.color_EA4C43;

    var path = Path();
    var width = size.width;
    var d = width / (chartList.length - 1);
    for (int i = 0; i < chartList.length; i++) {
      var heightValue = size.height / (maxValue - minValue);
      var xPosition = d * i;
      var yPosition = size.height - heightValue * chartList[i];
      if (i == 0) {
        path.moveTo(xPosition, yPosition);
      } else {
        path.lineTo(xPosition, yPosition);
      }
      canvas.drawCircle(Offset(xPosition, yPosition), 10.w, paintCircle);
    }
    canvas.drawPath(path, paintLine);

    //处理选中竖线逻辑
    if (hasDown && dy > 0 && dx > 0) {
      var index = (dx / d).round();
      // canvas.drawLine(Offset(dx,0), Offset(dx,size.height), paintLine);
      var xPosition = index * d;

      ///绘制选中竖线
      canvas.drawLine(
          Offset(xPosition, 0), Offset(xPosition, size.height), paintLine);

      ///绘制底部标签
      var leftPostion = xPosition - 40.w;
      var rightPosition = xPosition + 40.w;
      if (leftPostion < 0) {
        leftPostion = 0;
        rightPosition = 80.w;
      }
      if (rightPosition > size.width) {
        leftPostion = size.width - 80.w;
        rightPosition = size.width;
      }
      var rect2 = Rect.fromLTRB(
          leftPostion, size.height - 40.w, rightPosition, size.height);
      canvas.drawRect(rect2, paintRect);

      ///绘制标签文字
      ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
          ui.ParagraphStyle(fontSize: 20.sp, textAlign: TextAlign.center))
        ..pushStyle(ui.TextStyle(
            color: ColorStyle.color_white,
            textBaseline: TextBaseline.ideographic))
        ..addText((chartList[index]).toString());
      var paragraph = paragraphBuilder.build()
        ..layout(ui.ParagraphConstraints(width: 80.w));
      canvas.drawParagraph(paragraph, Offset(leftPostion, size.height - 30.w));
    }
  }
}
