import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/complain/model/my_feedback_entity.dart';
import 'package:open_eye/business/complain/widget/item_my_feedback_widget.dart';
import 'package:open_eye/http/apiservice/gateway_api.dart';
import 'package:open_eye/http/result/base_result.dart';
import 'package:open_eye/route/router_utils.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///我的反馈列表
class ComplainMyListPage extends BaseStatelessWidget<ComplainMyListController> {
  const ComplainMyListPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: RefreshWidget<ComplainMyListController>(
              refreshController: controller.refreshController,
              enablePullUp: false,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ItemMyFeedbackWidget(controller.feedbackList[index]),
                    onTap: () {
                      RouterUtils.toComplainRecordPage(
                          controller.feedbackList[index].id);
                    },
                  );
                },
                itemCount: controller.feedbackList.length,
              )),
        ));
  }

  @override
  String titleString() => "我的反馈";
}

class ComplainMyListController extends BaseRefreshController<GatewayApi> {
  RxList<MyFeedbackEntity> feedbackList = <MyFeedbackEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    super.loadNet();
    requestPageData();
  }

  @override
  void requestPageData({Refresh refresh = Refresh.first}) {
    httpRequest<BaseResult<List<MyFeedbackEntity>>>(api.queryMyFeedback(),
        (value) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        feedbackList.clear();
      }
      feedbackList.addAll(value.resObject!);
      hideRefresh(refreshController);
    });
  }
}

///依赖绑定
class ComplainMyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplainMyListController());
  }
}
