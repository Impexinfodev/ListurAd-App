import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class AddNewTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const AddNewTile({super.key, required this.title, this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 1)],
            ),
            child: Icon(Icons.add, size: 26.sp, color: AppColors.clr2388FF),
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppFonts.medium,
                  color: AppColors.clr2388FF,
                ),
              ),
              if (subtitle != null && subtitle!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.clr6D758F,
                      fontFamily: AppFonts.medium,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
