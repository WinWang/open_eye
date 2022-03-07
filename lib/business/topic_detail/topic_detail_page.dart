import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/topic_detail/widget/Topic_detail_entity.dart';
import 'package:open_eye/http/apiservice/api_service.dart';

class TopicDetailPage extends BaseStatelessWidget<TopicDetailController> {
  const TopicDetailPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Container();
  }
}

class TopicDetailController extends BaseController<ApiService> {
  String id = Get.arguments;
  Rx<TopicDetailEntity>? result;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    queryTopicDetailData();
  }

  void queryTopicDetailData() {
    httpRequest<TopicDetailEntity>(api.queryTopicDetail(id), (value) {
      result = value.obs;
    });
  }
}

class TopicDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopicDetailController());
  }
}
