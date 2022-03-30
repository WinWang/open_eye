import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateful_widget.dart';
import 'package:open_eye/business/custom_paint_page/painter/horizental_line_chart_painter.dart';
import 'package:open_eye/utils/log_utils.dart';

class LinesChartWidget extends CommonStatefulWidget {
  List<int> dataList;

  LinesChartWidget(this.dataList);

  @override
  State<StatefulWidget> createState() {
    return LinesChartState();
  }
}

class LinesChartState extends State<LinesChartWidget> {
  ///手指按下位置
  double tapDownX = 0;

  ///手指横向滚动距离
  double tapDeltaX = 0;

  ///上次滑动横向距离记录
  double lastDeltaX = 0;

  ///横向方向缩放比例
  double horizentalScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        size: Size(double.infinity, 400.w),
        painter: HorizentalLineChartPainter(
            widget.dataList, tapDeltaX, horizentalScale, (deltaX) {
          tapDeltaX = deltaX;
          lastDeltaX = tapDeltaX;
        }),
      ),
      onHorizontalDragStart: (details) {},
      onHorizontalDragEnd: (details) {
        lastDeltaX = tapDeltaX;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          var tempX = lastDeltaX + details.localPosition.dx - tapDownX;
          if (tempX > 0) {
            tempX = 0;
          }
          tapDeltaX = tempX;
        });
      },
      onHorizontalDragCancel: () {},
      onHorizontalDragDown: (details) {
        tapDownX = details.localPosition.dx;
      },
      onScaleStart: (details) {},
      onScaleUpdate: (details) {
        setState(() {
          horizentalScale = details.horizontalScale;
        });

        LogD(
            "监听手指状态放大缩小>>>>>>>>>${details.focalPoint.dx}>>>>>>${details.horizontalScale}");
      },
      onScaleEnd: (details) {},
    );
  }
}
