import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/res/colors.dart';

class VotePainter extends CustomPainter {
  double positiveNum;
  double negativeNum;

  //倾斜角度
  double slideWidth = 10.w;

  //斜线间距
  double gapWidth = 10.w;

  VotePainter(this.positiveNum, this.negativeNum);

  var votePaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var leftRatio = negativeNum / (negativeNum + positiveNum);
    var righRation = positiveNum / (negativeNum + positiveNum);

    var negativeTopRight = leftRatio * width + slideWidth - gapWidth;
    var negativeBottomRight = negativeTopRight - slideWidth;
    var positionLeftBottom = negativeBottomRight + gapWidth;
    var positionLeftTop = positionLeftBottom + slideWidth;

    //切除方角
    var clipPath = Path();
    // var rRect = RRect.fromLTRBAndCorners(0, 0, width, height,topLeft: Radius.circular(height/2));
    var rRect =
        RRect.fromLTRBR(0, 0, width, height, Radius.circular(height / 2));
    clipPath.addRRect(rRect);
    canvas.clipPath(clipPath);

    //绘制左边
    var leftPath = Path();
    leftPath.moveTo(0, 0);
    leftPath.lineTo(negativeTopRight, 0);
    leftPath.lineTo(negativeBottomRight, height);
    leftPath.lineTo(0, height);
    leftPath.close();
    votePaint.color = ColorStyle.color_24CF5F;
    canvas.drawPath(leftPath, votePaint);
    //绘制右边
    var rightPath = Path();
    rightPath.moveTo(width, 0);
    rightPath.lineTo(width, height);
    rightPath.lineTo(positionLeftBottom, height);
    rightPath.lineTo(positionLeftTop, 0);
    rightPath.close();
    votePaint.color = ColorStyle.color_EA4C43;
    canvas.drawPath(rightPath, votePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
