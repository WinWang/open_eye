import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'frame_animate_widget.dart';

////页面加载Loading动画
class LoadingWidget extends StatelessWidget {
  ///gaplessPlayback属性是解决加载帧动画闪烁，根本原因是图片解析速度跟不上帧动画加载速度，导致刚开始加载闪烁
  var imageCache = {
    0: Image.asset(
      "assets/images/loading/loding_00000.webp",
      gaplessPlayback: true,
    ),
    1: Image.asset("assets/images/loading/loding_00001.webp",
        gaplessPlayback: true),
    2: Image.asset("assets/images/loading/loding_00002.webp",
        gaplessPlayback: true),
    3: Image.asset("assets/images/loading/loding_00003.webp",
        gaplessPlayback: true),
    4: Image.asset("assets/images/loading/loding_00004.webp",
        gaplessPlayback: true),
    5: Image.asset("assets/images/loading/loding_00005.webp",
        gaplessPlayback: true),
    6: Image.asset("assets/images/loading/loding_00006.webp",
        gaplessPlayback: true),
    7: Image.asset("assets/images/loading/loding_00007.webp",
        gaplessPlayback: true),
    8: Image.asset("assets/images/loading/loding_00008.webp",
        gaplessPlayback: true),
    9: Image.asset("assets/images/loading/loding_00009.webp",
        gaplessPlayback: true),
    10: Image.asset("assets/images/loading/loding_00010.webp",
        gaplessPlayback: true),
    11: Image.asset("assets/images/loading/loding_00011.webp",
        gaplessPlayback: true),
    12: Image.asset("assets/images/loading/loding_00012.webp",
        gaplessPlayback: true),
    13: Image.asset("assets/images/loading/loding_00013.webp",
        gaplessPlayback: true),
    14: Image.asset("assets/images/loading/loding_00014.webp",
        gaplessPlayback: true),
    15: Image.asset("assets/images/loading/loding_00015.webp",
        gaplessPlayback: true),
    16: Image.asset("assets/images/loading/loding_00016.webp",
        gaplessPlayback: true),
    17: Image.asset("assets/images/loading/loding_00017.webp",
        gaplessPlayback: true),
    18: Image.asset("assets/images/loading/loding_00018.webp",
        gaplessPlayback: true),
    19: Image.asset("assets/images/loading/loding_00019.webp",
        gaplessPlayback: true),
    20: Image.asset("assets/images/loading/loding_00020.webp",
        gaplessPlayback: true),
    21: Image.asset("assets/images/loading/loding_00021.webp",
        gaplessPlayback: true),
    22: Image.asset("assets/images/loading/loding_00022.webp",
        gaplessPlayback: true),
    23: Image.asset("assets/images/loading/loding_00023.webp",
        gaplessPlayback: true)
  };

  LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameAnimateWidget(imageCache, 200.w, 200.w, Colors.transparent);
  }
}
