import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/utils/log_utils.dart';

///横向可滚动折现图表
class HorizentalLineChartPainter extends CustomPainter {
  List<int> dataList;

  int maxValue = 0;
  int minValue = 0;

  ///数据间隔
  double valueGap = 30.w;

  ///横向偏移量
  double tapXPosition = 0.0;

  ///图表宽度
  double chartWidth = 0.0;

  ///横向缩放比例
  double horizontalScale = 1;

  ///初始化边框、刻度画笔
  var backPaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.w
    ..color = ColorStyle.color_CCCCCC;

  ///初始化画笔-圆点
  var paintCircle = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = ColorStyle.color_FE8C28;

  ///初始化画笔-折线
  var paintLine = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.w
    ..color = ColorStyle.color_EA4C43;

  ValueChanged callback;

  HorizentalLineChartPainter(
      this.dataList, this.tapXPosition, this.horizontalScale, this.callback) {
    for (var value in dataList) {
      maxValue = max(maxValue, value);
      minValue = min(minValue, value);
    }
    chartWidth = valueGap * dataList.length;
    valueGap = horizontalScale * valueGap;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    //绘制背景
    drawBack(rect, canvas, size);
    //绘制value折线
    drawValueLine(rect, canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void drawBack(Rect rect, Canvas canvas, Size size) {
    ///裁剪多余空间路径
    var path = Path();
    path.addRect(rect);
    canvas.clipPath(path);

    ///绘制背景矩形边框
    canvas.drawRect(rect, backPaint);
    var perValue = (maxValue - minValue) / 4;
    var perHeight = (size.height - 20.w) / 4;
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

  ///绘制折线
  void drawValueLine(Rect rect, Canvas canvas, Size size) {
    var path = Path();
    LogD("横向滚动绝对值>>>>>>>>$tapXPosition");
    var maxChartWidth = (-dataList.length + 1) * valueGap + size.width;
    if (tapXPosition < maxChartWidth) {
      tapXPosition = maxChartWidth;
      callback(tapXPosition);
    }
    for (int i = 0; i < dataList.length; i++) {
      var heightValue = size.height / (maxValue - minValue);
      var xPosition = tapXPosition + valueGap * i;
      var yPosition = size.height - heightValue * dataList[i];
      if (i == 0) {
        path.moveTo(xPosition, yPosition);
      } else {
        path.lineTo(xPosition, yPosition);
      }
      canvas.drawCircle(Offset(xPosition, yPosition), 10.w, paintCircle);
    }
    canvas.drawPath(path, paintLine);
  }
}
