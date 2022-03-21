import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateless_widget.dart';
import 'package:open_eye/business/detail_page/widget/video_list_component.dart';
import 'package:open_eye/http/apiservice/api_service.dart';
import 'package:open_eye/res/colors.dart';
import 'package:open_eye/widget/base_network_image.dart';
import 'package:open_eye/widget/fijkplayer_skin/fijkplayer_skin.dart';
import 'package:open_eye/widget/fijkplayer_skin/video_config.dart';

///视频详情页面
// ignore: must_be_immutable
class DetailPage extends BaseStatelessWidget<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQueryData.fromWindow(window).padding.top,
          color: ColorStyle.color_black,
        ),
        Container(
          height: 450.w,
          color: ColorStyle.color_black,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Hero(
                    tag: controller.videoId,
                    child: BaseNetworkImage(
                      controller.coverUrl.value,
                      fit: BoxFit.cover,
                    ),
                  )),
              FijkView(
                player: controller.player,
                height: 450.w,
                color: ColorStyle.color_black,
                fit: FijkFit.cover,
                panelBuilder: (FijkPlayer player, FijkData data,
                    BuildContext context, Size viewSize, Rect texturePos) {
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
              )
            ],
          ),
        ),
        Expanded(
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: VideoListComponent((title, videoUrl) async {
                  controller.title.value = title;
                  await controller.player.reset();
                  controller.player.setDataSource(videoUrl, autoPlay: true);
                })

                ///迁移到BaseComponent实现
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Obx(() => GestureDetector(
                //           child: ItemVideoDetailWidget(
                //               controller.dataList[index],
                //               controller.selectIndex.value,
                //               index),
                //           onTap: () async {
                //             if (index == controller.selectIndex.value) {
                //               return;
                //             }
                //             var playUrl =
                //                 controller.dataList[index].data?.playUrl ?? "";
                //             var title =
                //                 controller.dataList[index].data?.title ?? "";
                //             controller.title.value = title;
                //             controller.selectIndex.value = index;
                //             await controller.player.reset();
                //             controller.player
                //                 .setDataSource(playUrl, autoPlay: true);
                //           },
                //         ));
                //   },
                //   itemCount: controller.dataList.length,
                // )
                ))
      ],
    );
  }

  @override
  bool showTitleBar() {
    return false;
  }

  @override
  bool useLoadSir() => false;
}

class DetailController extends BaseController<ApiService> {
  final FijkPlayer player = FijkPlayer();
  ShowConfigAbs videoConfig = PlayerShowConfig();
  String? playUrl = Get.parameters["playUrl"];
  String videoId = Get.parameters["videoId"] ?? ""; //视频ID
  RxString coverUrl = (Get.parameters["coverUrl"] ?? "").obs;
  RxString title = (Get.parameters["title"] ?? "").obs;

  ///迁移到BaseComponent实现
  // RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;
  // RxInt selectIndex = (-1).obs;

  @override
  void onReady() {
    super.onReady();
    player.setDataSource(playUrl ?? "", autoPlay: true);
    // loadNet();
  }

  @override
  void loadNet() {
    // queryVideoDetail();
  }

  // void queryVideoDetail() {
  //   httpRequest<FocusEntity>(api.queryVideoDetail(videoId), (value) {
  //     var itemList = value.itemList ?? [];
  //     var tempList = <FocusItemEntity>[];
  //     for (var element in itemList) {
  //       if ((element.type ?? "") == "videoSmallCard") {
  //         tempList.add(element);
  //       }
  //     }
  //     dataList.addAll(tempList);
  //   });
  // }

  @override
  void onClose() {
    super.onClose();
    player.release();
  }

  @override
  void onResumed() {
    super.onResumed();
    if (player.state == FijkState.paused) {
      player.start();
    }
  }

  @override
  void onPaused() {
    super.onPaused();
    if (player.state == FijkState.started) {
      player.pause();
    }
  }
}

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());

    ///注入BaseCompose控制器
    Get.lazyPut(() => VideoListController());
  }
}
