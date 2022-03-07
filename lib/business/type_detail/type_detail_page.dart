import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_refresh_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/find_page/model/Focus_Entity.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';
import 'package:open_eye/business/hot_page/widget/item_rank_widget.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/widget/base_network_image.dart';
import 'package:open_eye/widget/pull_smart_refresher.dart';

///分类详情页面
class TypeDetailPage extends BaseStatelessWidget<TypeDetailController> {
  const TypeDetailPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<TypeDetailController>(
        child: CustomScrollView(
      slivers: [_createSliverAppBar(), _createSliverList()],
    ));
  }

  ///顶部滚动AppBar
  Widget _createSliverAppBar() {
    return SliverAppBar(
      elevation: 8.0,
      title: Text(controller.typeName),
      pinned: true,
      expandedHeight: 400.w,
      flexibleSpace: FlexibleSpaceBar(
        background: BaseNetworkImage(
          controller.sliverBg,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _createSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return ItemRankWidget(controller.dataList[index]);
    }, childCount: controller.dataList.length));
  }

  @override
  bool showTitleBar() => false;
}

class TypeDetailController extends BaseRefreshController<ApiService> {
  String typeName = Get.parameters["typeName"] ?? "";
  String sliverBg = Get.parameters["headerImg"] ?? "";
  String typeId = Get.parameters["typeId"] ?? "";
  RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;
  var pageSize = 10;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    requestPageData();
  }

  @override
  void requestPageData({Refresh refresh = Refresh.first}) {
    httpRequest<FocusEntity>(api.queryTypeDetail(typeId, pageIndex * pageSize),
        (value) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      var itemList = value.itemList;
      if (itemList != null && itemList.isNotEmpty) {
        dataList.addAll(itemList);
      }
      hideRefresh(refreshController);
    });
  }
}

class TypeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeDetailController());
  }
}
