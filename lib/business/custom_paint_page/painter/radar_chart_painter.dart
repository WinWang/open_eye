import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/business/custom_paint_page/model/radar_view_entity.dart';
import 'package:open_eye/res/colors.dart';
import 'package:path_drawing/path_drawing.dart';

///雷达图画笔
class RadarChartPainter extends CustomPainter {
  List<RadarViewEntity> dataList;
  var maxValue = 0.0; //最大值

  RadarChartPainter(this.dataList);

  var textPadding = 0.0;

  ///线条画笔--绘制paht路径线条
  var linePaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.w
    ..color = ColorStyle.color_D9E1FB;

  var lineFillPathPaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = ColorStyle.color_503A65E6;

  var linePathPaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.w
    ..color = ColorStyle.color_3A65E6;

  var strokePaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = ColorStyle.color_DEE5FC;

  var dotPaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = ColorStyle.color_3A65E6;

  ///文字画笔
  var textPaint = TextPainter(
      textDirection: TextDirection.ltr, textAlign: TextAlign.center);

  @override
  void paint(Canvas canvas, Size size) {
    ///绘制圆环背景
    drawCircle(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void drawCircle(Canvas canvas, Size size) {
    //圆点
    var dotPoint = size.width / 2;

    ///最外圈
    var outRadius = size.width / 2 / 6 * 4;
    var offsetPoint = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(offsetPoint, outRadius, linePaint);
    strokePaint.color = ColorStyle.color_F3F6FE;
    canvas.drawCircle(offsetPoint, outRadius, strokePaint);

    ///中圈
    var middleRadius = size.width / 2 / 6 * 3;
    canvas.drawCircle(offsetPoint, middleRadius, linePaint);
    strokePaint.color = ColorStyle.color_E8EDFD;
    canvas.drawCircle(offsetPoint, middleRadius, strokePaint);

    ///内圈
    var innerRadius = size.width / 2 / 6 * 2;
    canvas.drawCircle(offsetPoint, innerRadius, linePaint);
    strokePaint.color = ColorStyle.color_DEE5FC;
    canvas.drawCircle(offsetPoint, innerRadius, strokePaint);

    ///绘制虚线--奇偶判断
    var perAngle = 360 / dataList.length * pi / 180;
    var startAngle = (-90) * pi / 180;
    if (dataList.length % 2 == 0) {
      //角度修改-针对偶数调整，奇数从-90开始绘制
      startAngle = startAngle + perAngle / 2;
    }
    for (int i = 0; i < dataList.length; i++) {
      var angle = startAngle + perAngle * i;
      var x = outRadius * cos(angle) + size.width / 2;
      var y = outRadius * sin(angle) + size.width / 2;
      var dashLinePath = Path();
      dashLinePath.moveTo(size.width / 2, size.width / 2);
      dashLinePath.lineTo(x, y);
      canvas.drawPath(
          dashPath(dashLinePath, dashArray: CircularIntervalList([3, 3])),
          linePaint);
      maxValue = max(maxValue, dataList[i].value);

      ///绘制文字
      textPaint.text = TextSpan(
          text: dataList[i].tag,
          style: TextStyle(fontSize: 20.sp, color: ColorStyle.color_89A3F0));
      textPaint.layout();
      var width = textPaint.width;
      var height = textPaint.height;
      var widgetRight = size.width;
      var textRight = x + width;
      if (x < dotPoint) {
        //左边
        if (y < dotPoint) {
          ///上边--第二象限
          if (width > x) {
            //超出边界
            textPaint.layout(maxWidth: x);
            textPaint.paint(canvas, Offset(0, y - height));
          } else {
            //未出边界
            var height = textPaint.height;
            textPaint.paint(canvas, Offset(x - width, y - height));
          }
        } else {
          ///下边--第三象限
          if (width > x) {
            textPaint.layout(maxWidth: x);
            textPaint.paint(canvas, Offset(0, y - height));
          } else {
            textPaint.layout(maxWidth: width);
            textPaint.paint(canvas, Offset(x - width, y));
          }
        }
      } else {
        //右边
        if (y < dotPoint) {
          var height = textPaint.height;
          ///上边--第一象限
          if (textRight > widgetRight) {
            //超出边界
            textPaint.layout(maxWidth: widgetRight - x);
            textPaint.paint(canvas, Offset(x, y - height));
          } else {
            if (startAngle == (-90) * pi / 180) {
              textPaint.paint(canvas, Offset(x - width / 2, y - height));
            } else {
              textPaint.paint(canvas, Offset(x, y - height));
            }
          }
        } else {
          ///下边--第四象限
          if (textRight > widgetRight) {
            //超出边界
            textPaint.layout(maxWidth: widgetRight - x);
            textPaint.paint(canvas, Offset(x, y - height));
          } else {
            textPaint.paint(canvas, Offset(x, y));
          }
        }
      }
    }

    ///绘制数据封闭区间
    var perValue = outRadius / maxValue;
    Path linePath = Path();
    Path lineFillPath = Path();
    for (int i = 0; i < dataList.length; i++) {
      var radiusSeal = perValue * dataList[i].value;
      var angle = startAngle + perAngle * i;
      var x = radiusSeal * cos(angle) + size.width / 2;
      var y = radiusSeal * sin(angle) + size.width / 2;
      if (i == 0) {
        linePath.moveTo(x, y);
        lineFillPath.moveTo(x, y);
      } else {
        linePath.lineTo(x, y);
        lineFillPath.lineTo(x, y);
      }
      canvas.drawCircle(Offset(x, y), 5.w, dotPaint);
    }
    linePath.close();
    lineFillPath.close();
    canvas.drawPath(linePath, linePathPaint);
    canvas.drawPath(lineFillPath, lineFillPathPaint);
  }
}
