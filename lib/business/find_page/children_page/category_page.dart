import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/base/controller/base_controller.dart';
import 'package:open_eye/base/pageWidget/base_stateful_widget.dart';
import 'package:open_eye/business/find_page/model/Type_entity.dart';
import 'package:open_eye/business/find_page/widget/item_category_widget.dart';
import 'package:open_eye/http/apiservice/api_service.dart';

///分类页面
class CategoryPage extends BaseStatefulWidget<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6.w, right: 6.w),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行三列
          childAspectRatio: 1.0, //显示区域宽高相等
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          return ItemCategoryWidget(controller.dataList[index]);
        },
        itemCount: controller.dataList.length,
      ),
    );
  }

  @override
  bool showTitleBar() {
    return false;
  }
}

class CategoryController extends BaseController<ApiService> {
  RxList<TypeEntity> dataList = <TypeEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    queryCategoryData();
  }

  void queryCategoryData() {
    httpRequest<List<TypeEntity>>(api.queryCategoryData(), (value) {
      if (value.isNotEmpty) {
        dataList.addAll(value);
      }
    });
  }
}

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
