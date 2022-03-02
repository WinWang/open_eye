import 'package:flutter/material.dart';

////逐帧动画展示Widget
class FrameAnimateWidget extends StatefulWidget {
  late Map<int, Image> imageCaches;
  late double width;
  late double height;
  late Color backColor;

  FrameAnimateWidget(this.imageCaches, this.width, this.height, this.backColor,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FrameAnimateState();
  }
}

class FrameAnimateState extends State<FrameAnimateWidget> {
  late bool _disposed;
  late Duration _duration;
  late int _imageIndex;
  late Container _container;

  @override
  void initState() {
    super.initState();
    _disposed = false;
    _duration = const Duration(milliseconds: 50);
    _imageIndex = 0;
    _container = Container(height: widget.height, width: widget.width,color: widget.backColor);
    _updateImage();
  }

  void _updateImage() {
    if (_disposed || widget.imageCaches.isEmpty) {
      return;
    }

    setState(() {
      if (_imageIndex >= widget.imageCaches.length) {
        _imageIndex = 0;
      }
      _container = Container(
          color: widget.backColor,
          child: widget.imageCaches[_imageIndex],
          height: widget.height,
          width: widget.width);
      _imageIndex++;
    });
    Future.delayed(_duration, () {
      _updateImage();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
    // widget.imageCaches.clear();
  }

  @override
  Widget build(BuildContext context) {
    return _container;
  }
}
