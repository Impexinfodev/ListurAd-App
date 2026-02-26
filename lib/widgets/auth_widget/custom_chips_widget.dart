import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_fonts.dart';


class CustomChipsWidget<T> extends StatelessWidget {
  final List<T> items;
  final Function(T) onDeleted;
  final String Function(T) getLabel;

  const CustomChipsWidget({
    super.key,
    required this.items,
    required this.onDeleted,
    required this.getLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.w,
      runSpacing: 6.h,
      children: items.map((item) {
        return InputChip(
          label: Text(
            getLabel(item),
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontFamily: AppFonts.regular,
            ),
          ),
          onDeleted: () => onDeleted(item),
          deleteIcon: Icon(
            Icons.close,
            size: 16.sp,
            color: Colors.grey[600],
          ),
          backgroundColor: Colors.grey[200],
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      }).toList(),
    );
  }
}


