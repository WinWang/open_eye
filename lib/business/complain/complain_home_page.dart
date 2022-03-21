import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/complain/widget/item_common_question_widget.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/strings.dart';
import 'package:open_eye/res/style.dart';
import 'package:open_eye/route/routes.dart';
import 'package:url_launcher/url_launcher.dart';

///投诉举报页面--首页
class ComplainHomePage extends BaseStatelessWidget<ComplainController> {
  const ComplainHomePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => Container(
          height: double.infinity,
          color: ColorStyle.color_white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _createTopWidget(0),
                DividerStyle.divider1Half,
                _createTopWidget(1),
                Container(
                  padding: EdgeInsets.only(left: 32.w),
                  height: 88.w,
                  color: ColorStyle.color_F5F5F5,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "常见问题",
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: ColorStyle.color_333333,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ItemCommonQuestionWidget(
                        controller.aqMap.keys.elementAt(index));
                  },
                  itemCount: controller.aqMap.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                _createBottomLayout(),
                Box.hBox20,
                Text(
                  "如对我们的服务有更好的建议，可随时在交易日\n09：00-18：00联系我们",
                  style: TextStyle(
                      fontSize: 24.sp, color: ColorStyle.color_999999),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }

  ///创建顶部Widget
  Widget _createTopWidget(int position) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.centerLeft,
        height: 88.w,
        color: ColorStyle.color_FFFFFF,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Box.wBox32,
            Image.asset(
              position == 0
                  ? "assets/images/icon_submit_question.png"
                  : "assets/images/icon_my_feedback.png",
              height: 50.w,
              width: 50.w,
            ),
            Box.wBox16,
            Text(
              position == 0 ? "点击提交问题" : "我的反馈",
              style: TextStyle(
                  fontSize: 32.sp,
                  color: ColorStyle.color_333333,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      onTap: () {
        if (position == 0) {
          //提交问题反馈
          Get.toNamed(
              AppRoutes.complainHomePage + AppRoutes.complainSubmitPage);
        } else {
          //我的反馈
          Get.toNamed(
              AppRoutes.complainHomePage + AppRoutes.complainMylistPage);
        }
      },
    );
  }

  Widget _createBottomLayout() => Container(
        color: ColorStyle.color_F0F0F0,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10.w))
        // ),
        padding:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 20.w, bottom: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 28.sp, color: ColorStyle.color_666666),
                      children: const <InlineSpan>[
                    TextSpan(text: "服务热线: "),
                    TextSpan(
                        text: "950496",
                        style: TextStyle(color: ColorStyle.color_EA4C43)),
                  ])),
              onTap: () {
                launch("tel://950496");
              },
            ),
            Box.hBox10,
            GestureDetector(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 28.sp, color: ColorStyle.color_666666),
                      children: const <InlineSpan>[
                    TextSpan(text: "投诉专线: "),
                    TextSpan(
                        text: "0755-88322555 转 2",
                        style: TextStyle(color: ColorStyle.color_EA4C43)),
                  ])),
              onTap: () {
                launch("tel:0755-88322555");
              },
            ),
            Box.hBox10,
            GestureDetector(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 28.sp, color: ColorStyle.color_666666),
                      children: const <InlineSpan>[
                    TextSpan(
                        text: "投诉专线: ",
                        style: TextStyle(color: Colors.transparent)),
                    TextSpan(
                        text: "020-22118777",
                        style: TextStyle(color: ColorStyle.color_EA4C43)),
                  ])),
              onTap: () {
                launch("tel:020-22118777");
              },
            ),
            GestureDetector(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 28.sp, color: ColorStyle.color_666666),
                      children: const <InlineSpan>[
                    TextSpan(text: "值班领导: "),
                    TextSpan(
                        text: "020-38381976",
                        style: TextStyle(color: ColorStyle.color_EA4C43)),
                  ])),
              onTap: () {
                launch("tel:020-38381976");
              },
            ),
            Box.hBox10,
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 28.sp, color: ColorStyle.color_666666),
                    children: const <InlineSpan>[
                  TextSpan(text: "服务时间: 交易日 09：00-18：00"),
                ])),
          ],
        ),
      );

  @override
  String titleString() => "投诉/建议";
}

class ComplainController extends BaseController {
  RxMap<String, String> aqMap = StringStyles.complainAQMap.obs;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    showSuccess();
  }
}

class ComplainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplainController());
  }
}
