import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/business/complain/model/feedback_list_item_entity.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';
import 'package:open_eye/route/router_utils.dart';
import 'package:open_eye/widget/base_network_image.dart';

class ItemFeedbackRecordWidget extends CommonStatelessWidget {
  FeedbackListItemEntity itemEntity;

  ItemFeedbackRecordWidget(this.itemEntity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///type 1用户消息  2老师消息
    ///contentType  1文字消息  2上传附件消息
    return Container(
      child: _createItemWidget(),
    );
  }

  Widget _createItemWidget() {
    if (itemEntity.type == 1) {
      return _createUserMessage();
    } else {
      return _createTeacherMessage();
      // return _createUserMessage();
    }
  }

  ///创建用户列表Item
  Widget _createUserMessage() {
    return Column(
      children: [
        Box.hBox30,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Container(
              // alignment: Alignment.topLeft,
              constraints: BoxConstraints(maxWidth: 400.w),
              padding: EdgeInsets.all(10.w),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         // image: const AssetImage("assets/images/back_right_chat.png"),
              //         // image: const AssetImage("assets/images/icon_test.png"),
              //         image: const AssetImage(
              //             "assets/images/back_right_chat_2.png"),
              //         // image: ResizeImage(
              //         //     const AssetImage("assets/images/back_right_chat.png"),
              //         //     height: 100.w.toInt(),
              //         //     width: 238.w.toInt()),
              //         // centerSlice: Rect.fromLTRB(16.w, 50.w, 216.w, 80.w),
              //         //       centerSlice: Rect.fromLTRB(40.w,40.w,100.w,75.w),//
              //         //       centerSlice: Rect.fromLTWH(20.w, 40.w, 160.w, 50.w),
              //         // centerSlice: Rect.fromLTWH(15,15,35,35),
              //         centerSlice: Rect.fromLTRB(26, 60, 86, 75),
              //         fit: BoxFit.fill)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: ColorStyle.color_white),
              child: _createTextOrImg(),
              // child: _create9(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.w),
              child: Image.asset(
                "assets/images/icon_right_triangle_white.png",
                height: 24.w,
                width: 24.w,
              ),
            ),
            Box.wBox15,
            CircleAvatar(
              radius: 40.w,
              backgroundImage: const NetworkImage(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp01%2F1ZZQ20QJS6-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1647411091&t=5ae667f54b72a3b742dbb26e13aa6131"),
              child: const Text(""),
            ),
            Box.wBox32
          ],
        )
      ],
    );
  }

  Widget _createTextOrImg() {
    if (itemEntity.contentType == 1) {
      return Text(
        itemEntity.content ?? "",
        style: TextStyle(fontSize: 30.sp, color: ColorStyle.color_000000),
      );
    } else {
      // return CachedNetworkImage(
      //   imageUrl: itemEntity.content ?? "",
      //   width: 250.w,
      //   fit: BoxFit.fitWidth,
      // );

      return GestureDetector(
          child: BaseNetworkImage(
            itemEntity.content ?? "",
            // "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.sucai.redocn.com%2Fattachments%2Fimages%2F201108%2F20110803%2FRedocn_2011073014594209.jpg&refer=http%3A%2F%2Fimg.sucai.redocn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1647776775&t=68a94bf059e39da45132b775c3504a13",
            width: 250.w,
            fit: BoxFit.cover,
          ),
          onTap: () {
            RouterUtils.toPreviewPhotoView(itemEntity.content);
          });
    }
  }

  ///创建老师列表Item
  Widget _createTeacherMessage() {
    return Column(
      children: [
        Box.hBox30,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Box.wBox32,
            CircleAvatar(
              radius: 40.w,
              backgroundImage:
                  const AssetImage("assets/images/icon_kefu_avator.png"),
              child: const Text(""),
            ),
            Box.wBox15,
            Container(
              margin: EdgeInsets.only(top: 20.w),
              child: Image.asset(
                "assets/images/icon_left_triangle_white.png",
                height: 24.w,
                width: 24.w,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: ColorStyle.color_white),
              child: _createTextOrImg(),
              constraints: BoxConstraints(maxWidth: 400.w),
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }
}
