import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class CustomDateInputField extends StatelessWidget {
  final String title;
  final DateTime? date;
  final VoidCallback onTap;

  const CustomDateInputField({super.key, required this.title, required this.date, required this.onTap});

  String _formatDate(DateTime? date) {
    if (date == null) return '--/--/----';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.clr687684,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  _formatDate(date),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: AppFonts.medium,
                    color: AppColors.clr2388FF,
                  ),
                ),
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 18.sp,
                color: AppColors.clr687684.withOpacity(0.80),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Divider(color: AppColors.clr687684.withOpacity(0.60), thickness: 1.w),
        ],
      ),
    );
  }
}
