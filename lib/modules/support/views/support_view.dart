import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/support/provider/support_provider.dart';
import 'package:provider/provider.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SupportProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            title: '',
            widget2: Row(
              crossAxisAlignment: .start,
              children: [
                Stack(
                  children: [
                    Image.asset(AppIcons.profileIc, height: 44.h, width: 44.w, fit: BoxFit.cover),
                    Positioned(
                      bottom: 7,
                      right: 0,
                      child: Container(
                        height: 10.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: AppColors.clr49DB1C,
                          boxShadow: [
                            BoxShadow(color: AppColors.clr34AF0F.withOpacity(0.10), blurRadius: 10),
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5.w),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: AppFonts.medium,
                        color: AppColors.clr141619,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Online',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.medium,
                        color: AppColors.clr49DB1C,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            widget: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.clr2388FF.withOpacity(0.10),
                  ),
                  child: Image.asset(
                    AppIcons.wifiCallIc,
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 16.w),
                Image.asset(AppIcons.menuIc, height: 26.h, width: 26.w, fit: BoxFit.contain),
                SizedBox(width: 16.w),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.clr2388FF.withOpacity(0.10),
                    ),
                    child: Image.asset(
                      AppIcons.chatSupportIc,
                      height: 36.h,
                      width: 36.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Welcome to Support',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.clr141619,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'We typically reply within a few minutes',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.clr687684,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: .start,
                    children: [
                      Image.asset(
                        AppIcons.profileIc,
                        height: 36.h,
                        width: 36.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppIcons.chatSendIc),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Text(
                                "Hi there! 👋 How can I help you today?",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppFonts.regular,
                                  color: AppColors.clr3F4E5D,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            supportReplyChips(provider),
                            SizedBox(height: 6.h),
                            Text(
                              '02:35 AM',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: AppFonts.medium,
                                color: AppColors.clr687684,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: .end,
                    mainAxisAlignment: .end,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.80,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppIcons.chatRecieveIc),
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.clr2388FF,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "I'm having trouble with my payment method. It keeps getting declined.",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppFonts.regular,
                                      color: Colors.white,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  '02:35 AM',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: AppFonts.medium,
                                    color: AppColors.clr687684,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 6.w),
                      // Image.asset(AppIcons.profileIc, height: 36.h, width: 36.w, fit: BoxFit.contain),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: .min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Row(
                  children: [
                    Image.asset(
                      AppIcons.pinIc,
                      height: 34.h,
                      width: 34.w,
                      fit: BoxFit.contain,
                      color: AppColors.clr141619,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextField(
                        borderRadius: 10.r,
                        fillColor: AppColors.clr2388FF.withOpacity(0.20),
                        hintText: 'Type Your message here',
                        hintColor: AppColors.clr141619.withOpacity(0.60),
                        leading1: Image.asset(
                          AppIcons.sendIc,
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(AppIcons.securityIc, height: 16.h, width: 16.w),
                  SizedBox(width: 4.w),
                  Text(
                    'End-to-end encrypted',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.regular,
                      color: AppColors.clr687684.withOpacity(0.80),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  Widget supportReplyChips(SupportProvider provider) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: provider.supportChips.map((chip) {
        return GestureDetector(
          onTap: () {
            // controller.text = chip;
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(color: AppColors.clr687684, width: 1.w),
            ),
            child: Text(
              chip,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppFonts.regular,
                color: AppColors.clr687684,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
