import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';

// ignore: must_be_immutable
class ItemVideoDetailWidget extends CommonStatelessWidget {
  FocusItemEntity itemData;

  int selectIndex;

  int itemIndex;

  ItemVideoDetailWidget(this.itemData, this.selectIndex, this.itemIndex,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyle.color_white,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 180.w,
      child: Row(
        children: [
          // BaseNetworkImage(
          //   itemData.data?.cover?.feed ?? "",
          //   height: 160.w,
          //   width: 250.w,
          //   fit: BoxFit.fill,
          // ),
          Container(
            width: 250.w,
            height: 160.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.w)),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      itemData.data?.cover?.feed ?? "",
                    ),
                    fit: BoxFit.cover)),
          ),
          Box.wBox16,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData.data?.title ?? "",
                style: TextStyle(
                    color: selectIndex == itemIndex
                        ? ColorStyle.color_EA4C43
                        : ColorStyle.color_333333,
                    fontSize: 28.w),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Box.hBox15,
              Text(
                itemData.data?.description ?? "",
                style:
                    TextStyle(color: selectIndex == itemIndex
                        ? ColorStyle.color_EA4C43
                        : ColorStyle.color_999999, fontSize: 24.w),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ))
        ],
      ),
    );
  }
}
