import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:pinput/pinput.dart';

class CustomOtpField extends StatelessWidget {
  final int length;
  final Function(String)? onCompleted;
  final String? Function(String?)? validator;

  const CustomOtpField({super.key, this.length = 6, this.onCompleted, this.validator});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        fontFamily: AppFonts.bold,
        color: AppColors.clr2388FF,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.clr2388FF, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.clr2388FF.withOpacity(0.10),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: AppColors.clr2388FF, width: 1.w),
      borderRadius: BorderRadius.circular(16.r),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: AppColors.clr2388FF, width: 1.w),
      borderRadius: BorderRadius.circular(16.r),
    );

    return Pinput(
      length: length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
    );
  }
}
