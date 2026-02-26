import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';

class CommonBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double? iconHeight;
  final double? iconWidth;
  final Color? backgroundColor;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final String iconPath;

  const CommonBackButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.padding,
    this.iconHeight,
    this.iconWidth,
    this.backgroundColor,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Image.asset(
        iconPath,
        fit: BoxFit.contain,
        height: iconHeight ?? 14.h,
        width: iconWidth ?? 12.w,
      ),

      // Container(
      //   padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      //   decoration: BoxDecoration(
      //     color: backgroundColor ?? Colors.white,
      //     borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      //     boxShadow:
      //         boxShadow ??
      //         [
      //           BoxShadow(
      //             color: AppColors.mainColor.withAlpha(10),
      //             blurRadius: 10,
      //             offset: const Offset(0, 0),
      //             spreadRadius: 0,
      //           ),
      //         ],
      //   ),
      //   child: Image.asset(
      //     iconPath,
      //     fit: BoxFit.contain,
      //     height: iconHeight ?? 14.h,
      //     width: iconWidth ?? 12.w,
      //   ),
      // ),
    );
  }
}
