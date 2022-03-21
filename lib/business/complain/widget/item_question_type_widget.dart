import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_eye/base/pageWidget/common_stateless_widget.dart';
import 'package:open_eye/res/colors.dart';

// ignore: must_be_immutable
class ItemQuestionTypeWidget extends CommonStatelessWidget {
  String itemValue;
  bool hasSelect;
  ValueChanged valueChanged;

  ItemQuestionTypeWidget(this.itemValue, this.hasSelect, this.valueChanged,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 216.w,
        height: 96.w,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
            color: ColorStyle.color_F5F5F5,
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            border: Border.all(
                width: 1.5.w,
                color:
                    hasSelect ? ColorStyle.color_EA4C43 : Colors.transparent)),
        child: Text(
          itemValue,
          style: TextStyle(
              fontSize: 32.sp,
              color: hasSelect
                  ? ColorStyle.color_EA4C43
                  : ColorStyle.color_666666),
        ),
      ),
      onTap: () {
        valueChanged.call(itemValue);
      },
    );
  }
}
