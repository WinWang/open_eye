import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/complain/widget/item_question_type_widget.dart';
import 'package:open_eye/http/apiservice/common_api.dart';
import 'package:open_eye/http/apiservice/gateway_api.dart';
import 'package:open_eye/http/request_params.dart';
import 'package:open_eye/http/result/base_result.dart';
import 'package:open_eye/model/upload_img_entity.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';
import 'package:open_eye/route/routes.dart';

class ComplainSubmitPage extends BaseStatelessWidget<ComplainSubmitController> {
  const ComplainSubmitPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: 80.w,
                      width: double.infinity,
                      color: ColorStyle.color_F5F5F5,
                      padding: EdgeInsets.only(left: 32.w),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "问题分类",
                        style: TextStyle(
                            fontSize: 32.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 192.w,
                      padding: EdgeInsets.only(left: 32.w),
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 96.w,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ItemQuestionTypeWidget(
                                controller.aqTypeList[index],
                                index == controller.selectValue.value,
                                (itemString) {
                              controller.selectValue.value = index;
                              controller.aqTypeList.refresh();
                            });
                          },
                          itemCount: controller.aqTypeList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    Container(
                      height: 80.w,
                      width: double.infinity,
                      color: ColorStyle.color_F5F5F5,
                      padding: EdgeInsets.only(left: 32.w, right: 32.w),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "留下您要反馈的内容",
                            style: TextStyle(
                                fontSize: 32.sp, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            "${controller.numCount.value}/500",
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorStyle.color_999999),
                          ),
                        ],
                      ),
                    ),
                    Box.hBox10,
                    Container(
                      height: 400.w,
                      padding: EdgeInsets.only(left: 32.w, right: 32.w),
                      alignment: Alignment.topLeft,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 32.w, color: ColorStyle.color_333333),
                        controller: controller.editingController,
                        maxLines: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          counterStyle:
                              const TextStyle(color: Colors.transparent),
                          hintText: "请输入您的反馈",
                          hintStyle: TextStyle(
                              color: ColorStyle.color_666666, fontSize: 32.w),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        maxLength: 500,
                        onChanged: (valueInput) {
                          controller.numCount.value = valueInput.length;
                          controller.question = valueInput;
                        },
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 32.w),
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 90.w,
                          height: 90.w,
                          child: Stack(
                            children: [
                              Visibility(
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/images/icon_image_upload.png",
                                    height: 72.w,
                                    width: 72.w,
                                  ),
                                  onTap: () {
                                    controller.getImage();
                                  },
                                ),
                                visible:
                                    controller.selectImagePath.value.isEmpty
                                        ? true
                                        : false,
                              ),
                              Visibility(
                                child: Stack(
                                  children: [
                                    Align(
                                      child: Image.network(
                                        controller.selectImagePath.value,
                                        width: 72.w,
                                        height: 72.w,
                                        fit: BoxFit.cover,
                                      ),
                                      alignment: Alignment.bottomLeft,
                                    ),
                                    Align(
                                      child: GestureDetector(
                                        child: Image.asset(
                                          "assets/images/icon_close.png",
                                          height: 32.w,
                                          width: 32.w,
                                        ),
                                        onTap: () {
                                          controller.selectImagePath.value = "";
                                        },
                                      ),
                                      alignment: Alignment.topRight,
                                    ),
                                  ],
                                ),
                                visible:
                                    controller.selectImagePath.value.isEmpty
                                        ? false
                                        : true,
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              flex: 1,
            ),
            GestureDetector(
              child: Container(
                height: 112.w,
                width: double.infinity,
                alignment: Alignment.center,
                color: controller.numCount.value > 0
                    ? ColorStyle.color_EA4C43
                    : ColorStyle.color_CCCCCC,
                child: Text(
                  "提交",
                  style: TextStyle(
                      fontSize: 34.sp, color: ColorStyle.color_FFFFFF),
                ),
              ),
              onTap: () {
                if (controller.numCount.value > 0) {
                  showToast('提交');
                  controller.addMyFeedback();
                }
              },
            ),
          ],
        ));
  }

  @override
  String titleString() {
    return "提交反馈";
  }

  @override
  bool useLoadSir() {
    return false;
  }
}

class ComplainSubmitController extends BaseController<GatewayApi> {
  RxList aqTypeList = ["功能建议", "功能异常", "其他反馈"].obs;

  RxInt selectValue = 0.obs;

  RxInt numCount = 0.obs;

  String question = "";

  RxString selectImagePath = "".obs;

  TextEditingController editingController = TextEditingController();

  late CommonApi _commonApi;

  @override
  void onReady() {
    super.onReady();
    _commonApi = Get.find<CommonApi>();
  }

  void addMyFeedback() {
    var requestBody = RequestParams()
        .put("type", selectValue.value)
        .put("question", question)
        .put("imgUrl", selectImagePath.value)
        .getRequestBody();
    httpRequest<BaseResult<int>>(api.addFeedBack(requestBody), (value) {
      if ("1" == value.resCode) {
        // showToast(value.resMessage);
        // editingController.text = "";
        // question = "";
        // numCount.value = 0;
        // RouterUtils.toComplainRecordPage(value.resObject);
        Get.offNamed(
            AppRoutes.complainHomePage + AppRoutes.complainMyRecordPage,
            arguments: value.resObject);
      }
    }, handleError: false);
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var path = image?.path ?? "";
    if (path.isEmpty) {
      return;
    }
    var file = File(path);
    _commonApi.uploadImage(file);
    httpRequest<BaseResult<UploadImgEntity>>(_commonApi.uploadImage(file),
        (value) {
      selectImagePath.value = value.resObject?.imgUrl ?? "";
    });
  }

  @override
  void loadNet() {}
}

class ComplainSubmitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplainSubmitController());
  }
}
