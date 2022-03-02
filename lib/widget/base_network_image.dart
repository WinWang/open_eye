import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

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
            return Image.asset(
              "assets/images/back_placeholder.png",
              // centerSlice: const Rect.fromLTRB(24, 26, 95, 93),
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              "assets/images/back_placeholder.png",
              // centerSlice: const Rect.fromLTRB(24, 26, 95, 93),
            );
          },
          fadeInDuration: const Duration(milliseconds: 0),
          fadeOutDuration: const Duration(milliseconds: 0),
        );
}
