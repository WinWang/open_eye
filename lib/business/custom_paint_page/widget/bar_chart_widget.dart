import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateful_widget.dart';
import 'package:open_eye/business/custom_paint_page/painter/bar_chart_painter.dart';
import 'dart:ui' as ui;

import 'package:open_eye/utils/log_utils.dart';

class BarChartWidget extends CommonStatefulWidget {
  List<double> barList;

  BarChartWidget(this.barList);

  @override
  State<StatefulWidget> createState() {
    return BarChartState();
  }
}

class BarChartState extends State<BarChartWidget> {
  double dx = -1;
  double dy = -1;
  bool hasTouchDown = false;
  late ui.Image _image;

  @override
  void initState() {
    super.initState();
    LogE(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>初始状态msg");
    load("assets/images/icon_text_tag.png")
        .then((value) {
      LogE("获取图片>>>>>>>>>>>" + value.toString());
      setState(() {
        _image = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        size: Size(double.infinity, 300.w),
        painter: BarChartPainter(widget.barList, hasTouchDown, dx, dy, _image),
      ),
      onHorizontalDragUpdate: (details) {
        setState(() {
          hasTouchDown = true;
          dx = details.localPosition.dx;
          dy = details.localPosition.dy;
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          hasTouchDown = false;
          dx = -1;
          dy = -1;
        });
      },
      onLongPressDown: (details) {
        setState(() {
          hasTouchDown = true;
          dx = details.localPosition.dx;
          dy = details.localPosition.dy;
        });
      },
      onLongPressMoveUpdate: (details) {
        setState(() {
          hasTouchDown = true;
          dx = details.localPosition.dx;
          dy = details.localPosition.dy;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          hasTouchDown = false;
          dx = -1;
          dy = -1;
        });
      },
    );
  }

  /// 通过assets路径，获取资源图片
  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}
