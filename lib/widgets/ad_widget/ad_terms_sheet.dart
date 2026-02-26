import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/custom_dropdown.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/common_widgets/multiselect_location_dropdown.dart';
import 'package:list_ur_add/common_widgets/single_select_location_dropdown.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/routes/routes.dart';

class AdTermsSheet {
  static show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.75,
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
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, size: 24.sp),
                      ),
                      SizedBox(width: 80.w),
                      Text(
                        'Terms & Privacy',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: AppFonts.medium,
                          color: AppColors.clr141619,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 25.h),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: AppFonts.bold,
                            color: AppColors.clr19213D,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "By using our app, you agree to these terms. You must be at least 13 years old. We may update these terms, and your continued use means you accept the changes. You're responsible for your account and content. We can suspend or terminate your account for violations. Our app is provided 'as is,' and we're not liable for damages. These terms are governed by the laws of the jurisdiction where our company is registered.",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: AppFonts.regular,
                            color: AppColors.clr0D141C,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'I agree to the Terms and Conditions',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: AppFonts.regular,
                                color: AppColors.clr0D141C,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(width: 2.w, color: AppColors.clrD1DBE8),
                                ),
                                child: Icon(Icons.check, size: 12.sp, color: AppColors.clr687684),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: AppFonts.bold,
                            color: AppColors.clr19213D,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "By using our app, you agree to these terms. You must be at least 13 years old. We may update these terms, and your continued use means you accept the changes. You're responsible for your account and content. We can suspend or terminate your account for violations. Our app is provided 'as is,' and we're not liable for damages. These terms are governed by the laws of the jurisdiction where our company is registered.",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: AppFonts.regular,
                            color: AppColors.clr0D141C,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'I agree to the Privacy Policy',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: AppFonts.regular,
                                color: AppColors.clr0D141C,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(width: 2.w, color: AppColors.clrD1DBE8),
                                ),
                                child: Icon(Icons.check, size: 12.sp, color: AppColors.clr687684),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 39.h),
                        CustomButton(buttonName: 'Agree & Continue', onPressed: (){
                          Navigator.pushNamed(context, AppRoutes.ad);
                        }),
                      ],
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
