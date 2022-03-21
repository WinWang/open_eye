import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/business/complain/model/my_feedback_entity.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';

// ignore: must_be_immutable
class ItemMyFeedbackWidget extends CommonStatelessWidget {
  MyFeedbackEntity item;

  ItemMyFeedbackWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 144.w,
      padding: EdgeInsets.only(left: 32.w, right: 32.w),
      alignment: Alignment.center,
      width: double.infinity,
      child: Container(
        height: 88.w,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            CircleAvatar(
              child: const Text(""),
              backgroundImage: const NetworkImage(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp01%2F1ZZQ20QJS6-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1647411091&t=5ae667f54b72a3b742dbb26e13aa6131"),
              radius: 44.w,
              backgroundColor: Colors.transparent,
            ),
            Box.wBox16,
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.getContentTypeString(),
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorStyle.color_333333),
                    maxLines: 1,
                  ),
                  Text(
                    item.content ?? "",
                    style: TextStyle(
                        fontSize: 28.sp, color: ColorStyle.color_999999),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              height: double.infinity,
              alignment: Alignment.topLeft,
              child: Text(
                item.getDateString(),
                style:
                    TextStyle(fontSize: 24.sp, color: ColorStyle.color_999999),
              ),
            )
          ],
        ),
      ),
    );
  }
}
