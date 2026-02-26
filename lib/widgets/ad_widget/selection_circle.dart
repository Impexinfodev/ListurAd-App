import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';

class SelectionCircle extends StatelessWidget {
  final bool isSelected;

  const SelectionCircle({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      width: 18.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.clr1A73E8 : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.clrD9D9D9,
          width: 1,
        ),
      ),
      child: isSelected
          ? Center(
        child: Icon(
          Icons.check,
          size: 12.sp,
          color: Colors.white,
        ),
      )
          : null,
    );
  }
}
