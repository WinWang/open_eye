import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/detail_page/widget/item_video_detail_widget.dart';
import 'package:open_eye/business/find_page/model/Focus_Entity.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/widget/fijkplayer_skin/fijkplayer_skin.dart';
import 'package:open_eye/widget/fijkplayer_skin/video_config.dart';

///视频详情页面
// ignore: must_be_immutable
class DetailPage extends BaseStatelessWidget<DetailController> {
  DetailPage({Key? key}) : super(key: key);

  var videoPlayHeight = 450.w;

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQueryData.fromWindow(window).padding.top,
          color: ColorStyle.color_black,
        ),
        FijkView(
          player: controller.player,
          height: videoPlayHeight,
          fit: FijkFit.cover,
          panelBuilder: (FijkPlayer player, FijkData data, BuildContext context,
              Size viewSize, Rect texturePos) {
            return Obx(() => CustomFijkPanel(
                  player: player,
                  viewSize: viewSize,
                  texturePos: texturePos,
                  playerTitle: controller.title.value,
                  showConfig: controller.videoConfig,
                  curPlayUrl: '',
                  pageContent: context,
                ));
          },
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: ItemVideoDetailWidget(controller.dataList[index]),
              onTap: () async {
                var playUrl = controller.dataList[index].data?.playUrl ?? "";
                var title = controller.dataList[index].data?.title ?? "";
                controller.title.value = title;
                controller.player.setDataSource(playUrl, autoPlay: true);
              },
            );
          },
          itemCount: controller.dataList.length,
        ))
      ],
    );
  }

  @override
  bool showTitleBar() {
    return false;
  }
}

class DetailController extends BaseController<ApiService> {
  final FijkPlayer player = FijkPlayer();
  ShowConfigAbs videoConfig = PlayerShowConfig();
  String? playUrl = Get.parameters["playUrl"];
  String videoId = Get.parameters["videoId"] ?? ""; //视频ID
  RxString coverUrl = (Get.parameters["coverUrl"] ?? "").obs;
  RxString title = (Get.parameters["title"] ?? "").obs;
  RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    player.setDataSource(playUrl ?? "", autoPlay: true);
    loadNet();
  }

  @override
  void loadNet() {
    queryVideoDetail();
  }

  void queryVideoDetail() {
    httpRequest<FocusEntity>(api.queryVideoDetail(videoId), (value) {
      var itemList = value.itemList ?? [];
      var tempList = <FocusItemEntity>[];
      for (var element in itemList) {
        if ((element.type ?? "") == "videoSmallCard") {
          tempList.add(element);
        }
      }
      dataList.addAll(tempList);
    });
  }

  @override
  void onClose() {
    super.onClose();
    player.release();
  }
}

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
