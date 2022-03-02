import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/business/find_page/model/Type_entity.dart';
import 'package:open_eye/res/colors.dart';

class ItemCategoryWidget extends CommonStatelessWidget {
  TypeEntity itemData;

  ItemCategoryWidget(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 350.w,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(itemData.bgPicture ?? ""))),
      child: Text(
        itemData.name ?? "",
        style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: ColorStyle.color_white),
      ),
    );
  }
}
