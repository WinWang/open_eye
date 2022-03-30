import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/utils/log_utils.dart';

// ignore: must_be_immutable
class BaseNetworkImage extends CachedNetworkImage {
  String imgUrl;

  BaseNetworkImage(
    this.imgUrl, {
    width,
    fit,
    height,
    Key? key,
  }) : super(
          key: key,
          imageUrl: imgUrl,
          height: height,
          width: width,
          fit: fit,
          placeholder: (context, url) {
            // var height2 = context.height;
            // var width2 = context.width;
            // LogWTF("链接、宽高>>>>>>>>>>>>>>$height2>>>>>>>>$width2>>>>>>$url");
            double size = 50;
            if (width != null && width != double.infinity) {
              size = width * 0.5;
            } else if (height != null) {
              size = height * 0.5;
            }
            return Icon(
              Icons.image,
              size: size,
              color: ColorStyle.color_999999,
            );
            return Image.asset(
              "assets/images/back_placeholder.png", width: width,
              height: height,
              // centerSlice: const Rect.fromLTRB(24, 26, 95, 93),  //.9图的效果（有问题，待处理）
            );
          },
          errorWidget: (context, url, error) {
            double size = 50;
            if (width != null && width != double.infinity) {
              size = width * 0.5;
            } else if (height != null) {
              size = height * 0.5;
            }
            return Icon(
              Icons.image,
              size: size,
              color: ColorStyle.color_666666,
            );
            return Image.asset(
              "assets/images/back_placeholder.png", width: width,
              height: height,
              // centerSlice: const Rect.fromLTRB(24, 26, 95, 93),  //.9图的效果（有问题，待处理）
            );
          },
          fadeInDuration: const Duration(milliseconds: 0),
          fadeOutDuration: const Duration(milliseconds: 0),
        );
}
