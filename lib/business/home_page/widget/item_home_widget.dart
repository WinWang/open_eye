import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/business/home_page/model/ItemList.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';
import 'package:open_eye/route/router_utils.dart';
import 'package:open_eye/route/routes.dart';
import 'package:open_eye/widget/base_network_image.dart';

class ItemHomeWidget extends CommonStatelessWidget {
  ItemList itemData;
  int index;
  final SwiperController _controller;

  ItemHomeWidget(this.itemData, this.index, this._controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var type = itemData.type ?? "";
    if (type == "banner2") {
      return _createSwiper();
    } else if (type == "video") {
      return GestureDetector(
          child: _createContent(),
          onTap: () {
            var playUrl = itemData.data?.playUrl;
            var coverUrl = itemData.data?.cover?.feed;
            var videoId = itemData.data?.id;
            var map = <String, String>{};
            map["playUrl"] = playUrl ?? "";
            map["coverUrl"] = coverUrl ?? "";
            map["videoId"] = "$videoId";
            Get.toNamed(AppRoutes.detailPage, parameters: map);
          });
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }

  Widget _createSwiper() {
    // return BaseNetworkImage(itemData.data?.image ?? "",height: 400.w,fit: BoxFit.fitWidth,);
    var bannerUrl = itemData.data?.image ?? "";
    return SizedBox(
      height: 400.w,
      child: Swiper(
        autoplay: true,
        autoplayDelay: 5000,
        controller: _controller,
        itemCount: bannerUrl.isEmpty ? 0 : 1,
        itemBuilder: (BuildContext context, int index) {
          return BaseNetworkImage(
            bannerUrl,
            height: 400.w,
            fit: BoxFit.fitWidth,
          );
        },
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                size: 12.w,
                activeSize: 12.w,
                activeColor: ColorStyle.color_EA4C43,
                color: ColorStyle.color_999999)),
      ),
    );
  }

  Widget _createContent() {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400.w,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.w)),
                child: Hero(
                  tag: itemData.data?.id?.toString() ?? "",
                  child: BaseNetworkImage(
                    itemData.data?.cover?.feed ?? "",
                    height: 400.w,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 25.w, right: 33.w),
                  height: 42.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.w),
                        bottomRight: Radius.circular(42.w)),
                    color: ColorStyle.color_EA4C43,
                  ),
                  child: Text(
                    itemData.data?.category ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 150.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Box.wBox16,
                GestureDetector(
                  child: ClipOval(
                    child: BaseNetworkImage(
                      itemData.data?.author?.icon ?? "",
                      width: 80.w,
                      height: 80.w,
                    ),
                  ),
                  onTap: () {
                    RouterUtils.toPreviewPhotoView(itemData.data?.author?.icon);
                  },
                ),
                Box.wBox16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        itemData.data?.author?.name ?? "",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 30.sp,
                            color: ColorStyle.color_333333,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      width: 500.w,
                    ),
                    Box.hBox15,
                    SizedBox(
                      child: Text(
                        itemData.data?.author?.description ?? "",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 27.sp,
                            color: ColorStyle.color_999999),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      width: 500.w,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.w))),
    );
  }
}
