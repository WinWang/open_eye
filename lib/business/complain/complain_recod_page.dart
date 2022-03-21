import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/complain/model/Feedback_detail_list_entity.dart';
import 'package:open_eye/business/complain/model/feedback_list_item_entity.dart';
import 'package:open_eye/business/complain/widget/item_feedback_record_widget.dart';
import 'package:open_eye/http/apiservice/common_api.dart';
import 'package:open_eye/http/apiservice/gateway_api.dart';
import 'package:open_eye/http/request_params.dart';
import 'package:open_eye/http/result/base_result.dart';
import 'package:open_eye/model/upload_img_entity.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/res/style.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_eye/utils/keyboard_util.dart';

//我的反馈页面UI
class ComplainRecordPage extends BaseStatelessWidget<ComplainRecordController> {
  const ComplainRecordPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide(
        color: ColorStyle.color_F5F5F5,
      ),
    );

    return Obx(() => Container(
          color: ColorStyle.color_d5d5d5,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemFeedbackRecordWidget(
                          controller.recordList[index]);
                      // return Container();
                    },
                    itemCount: controller.recordList.length,
                    controller: controller.scrollController,
                  )),
              Container(
                color: ColorStyle.color_FFFFFF,
                height: 112.w,
                width: double.infinity,
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "assets/images/icon_image_upload.png",
                        height: 72.w,
                        width: 72.w,
                      ),
                      onTap: () async {
                        controller.getImage();
                      },
                    ),
                    Box.wBox10,
                    Expanded(
                      flex: 1,
                      child: TextField(
                        style: TextStyle(fontSize: 32.sp),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 15.w),
                          //内容内边距，影响高度,
                          border: _outlineInputBorder,
                          hintText: "请输入内容",
                          hintStyle:
                              const TextStyle(color: ColorStyle.color_999999),
                        ),
                        controller: controller.editingController,
                        onChanged: (value) {
                          controller.inputString.value = value;
                        },
                        maxLines: 1,
                      ),
                    ),
                    Box.wBox10,
                    SizedBox(
                        height: 75.w,
                        width: 140.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.inputString.value.isNotEmpty) {
                              controller.insertAnswer("");
                              KeyboardUtils.hideKeyboard(context);
                            }
                          },
                          child: Text(
                            '发送',
                            style: TextStyle(
                                fontSize: 34.sp, color: ColorStyle.color_white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  controller.inputString.value.isEmpty
                                      ? ColorStyle.color_CCCCCC
                                      : ColorStyle.color_EA4C43)),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  @override
  String titleString() => "反馈记录";
}

///控制器
class ComplainRecordController extends BaseController<GatewayApi> {
  TextEditingController editingController = TextEditingController();

  RxList<FeedbackListItemEntity> recordList = <FeedbackListItemEntity>[].obs;

  RxString inputString = "".obs;

  int _id = -1;

  late CommonApi _commonApi;

  ScrollController scrollController = ScrollController();

  Timer? _timer;

  @override
  void onReady() {
    _id = Get.arguments;
    _commonApi = Get.find<CommonApi>();
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    queryFeedbackDetail();
  }

  void queryFeedbackDetail() {
    httpRequest<BaseResult<FeedbackDetailListEntity>>(api.feedbackDetails(_id),
        (value) {
      recordList.clear();
      recordList.addAll(value.resObject?.list ?? []);

      ///滚动到底部
      _timer = Timer(const Duration(milliseconds: 700), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
    });
  }

  ///图片上传
  Future getImage() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      var path = image?.path;
      var file = File(path ?? "");
      _commonApi.uploadImage(file);
      httpRequest<BaseResult<UploadImgEntity>>(_commonApi.uploadImage(file),
          (value) {
        insertAnswer(value.resObject?.imgUrl);
      });
    } catch (e) {
      showToast("图片上传异常${e.toString()}");
    }
  }

  ///添加答案
  void insertAnswer(String? netPath) {
    var requestBody = RequestParams()
        .put("content", inputString.value)
        .put("imgUrl", netPath)
        .put("id", _id)
        .put("type", 1)
        .getRequestBody();
    httpRequest(api.insertAnswer(requestBody), (value) {
      editingController.text = "";
      inputString.value = "";
      queryFeedbackDetail();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}

///绑定器
class ComplainRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplainRecordController());
  }
}
