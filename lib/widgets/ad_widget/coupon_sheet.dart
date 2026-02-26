import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class CouponSheet {
  static show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.50,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.clr687684.withOpacity(0.2))),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Available Coupons',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: AppFonts.medium,
                          color: AppColors.clr141619,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, size: 24.sp, color: AppColors.clr6A6C70),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              dashPattern: [10, 5],
                              strokeWidth: 1.5, 
                              color: AppColors.clr2DC70E,
                              radius: Radius.circular(16.r),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: AppColors.clr2DC70E.withOpacity(0.10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.clr26E400.withOpacity(0.10),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        'SAVE10',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.clr30AF17,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        'Get 10% off on your order.',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: AppFonts.medium,
                                          color: AppColors.clr2DC70E,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'APPLY',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: AppFonts.semibold,
                                      color: AppColors.clr2388FF,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
