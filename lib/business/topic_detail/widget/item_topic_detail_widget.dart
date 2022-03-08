import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/business/topic_detail/model/Topic_ItemList.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';
import 'package:open_eye/widget/base_network_image.dart';

// ignore: must_be_immutable
class ItemTopicDetailWidget extends CommonStatelessWidget {
  TopicItemList itemData;

  ItemTopicDetailWidget(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: _createContent(), onTap: () {});
  }

  Widget _createContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BaseNetworkImage(
          itemData.data?.content?.data?.cover?.feed ?? "",
          height: 400.w,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Box.hBox20,
        Text(
          itemData.data?.content?.data?.title ?? "",
          style: TextStyle(fontSize: 26.sp, color: ColorStyle.color_black),
        ),
        Container(
          color: ColorStyle.color_white,
          padding: EdgeInsets.only(
              left: 32.w, right: 32.w, bottom: 15.w, top: 15.w),
          child: Text(
            itemData.data?.content?.data?.description ?? "",
            style:
            TextStyle(fontSize: 22.sp, color: ColorStyle.color_666666),
          ),
        )
      ],
    );
  }
}
