import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/modules/ad/views/live_ad_view.dart';
import 'package:list_ur_add/routes/routes.dart';

class SuccessView extends StatefulWidget {
  final AdLayoutType? layoutType;

  const SuccessView({super.key, this.layoutType});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Container(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 22.w, vertical: 22.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.clr0059BA.withOpacity(0.20),
                      AppColors.clr0076F6.withOpacity(0.20),
                    ],
                  ),
                ),
                child: Image.asset(
                  AppIcons.checkIcon,
                  height: 66.h,
                  width: 66.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                'Payment Successful!',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: AppFonts.semibold,
                  color: AppColors.clr141619,
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                textAlign: .center,
                "Your ad has been submitted and is now pending review. You will be notified once it goes live",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: AppFonts.regular,
                  color: AppColors.clr6E6E6E.withOpacity(0.80),
                ),
              ),
              SizedBox(height: 39.h),
              CustomButton(
                buttonName: 'Check Your Ad',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveAdView(layoutType: widget.layoutType),
                    ),
                  );
                },
                backgroundGradient: LinearGradient(
                  colors: [AppColors.clr0059BA, AppColors.clr0076F6],
                ),
              ),
              SizedBox(height: 18.h),
              CustomButton(
                buttonName: "Go to Home",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
                },
                backgroundColor: Colors.white,
                textColor: AppColors.clr0076F6,
                borderGradient: LinearGradient(colors: [AppColors.clr0059BA, AppColors.clr0076F6]),
                borderWidth: 2.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
