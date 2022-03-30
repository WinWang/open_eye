import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateful_widget.dart';
import 'package:open_eye/utils/log_utils.dart';

import '../painter/line_chart_painter.dart';

class LineChartWidget extends CommonStatefulWidget {
  List<int> chartList;

  LineChartWidget({Key? key, required this.chartList});

  @override
  State<StatefulWidget> createState() {
    return LineChartState();
  }
}

class LineChartState extends State<LineChartWidget> {
  double dx = -1; //触摸很想
  double dy = -1;
  bool hasDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        painter: LineChartPainter(
            chartList: widget.chartList, dx: dx, dy: dy, hasDown: hasDown),
        size: Size(double.infinity, 400.w),
      ),
      onTapDown: (details) {
        // LogD("msg>>>>>>>手指放下");
      },
      onTapUp: (details) {
        // LogD("msg>>>>>>>手指抬起");
        setState(() {
          hasDown = false;
          dx = -1;
          dy = -1;
        });
      },
      onLongPressDown: (LongPressDownDetails details) {
        // LogD("msg>>>>>>手指长按下");
        setState(() {
          hasDown = true;
          dx = details.localPosition.dx;
          dy = details.localPosition.dy;
        });
      },
      onLongPressUp: () {
        // LogD("msg>>>>>>>长按手指抬起");
        setState(() {
          hasDown = false;
          dx = -1;
          dy = -1;
        });
      },
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
        // LogD("${details.localPosition.dx}>>>>>${details.localPosition.dy}");
        setState(() {
          dx = details.localPosition.dx;
          dy = details.localPosition.dy;
        });
      },
      onLongPressEnd: (LongPressEndDetails details) {
        // LogD("msg>>>>>>>>>长按结束");
        setState(() {
          hasDown = false;
          dx = -1;
          dy = -1;
        });
      },

      onHorizontalDragDown: (details){
        // LogD("msg>>>>>>>>>>>onHorizontalDragDown");
      },

      onHorizontalDragUpdate: (details){
        // LogD("msg>>>>>>>>>>onHorizontalDragUpdate");
        setState(() {
          dx = details.localPosition.dx;
          dy = details.localPosition.dy;
        });
      },

      onHorizontalDragEnd: (details){
        setState(() {
          hasDown = false;
          dx = -1;
          dy = -1;
        });
      },

    );
  }
}
