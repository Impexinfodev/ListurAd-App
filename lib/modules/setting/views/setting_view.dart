import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_toggle_switch.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool value = false;
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Setting'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Column(
          children: [
            iconTextRow(AppIcons.privacyPolicyIc, 'Privacy Policy'),
            SizedBox(height: 14.h),
            iconTextRow(
              AppIcons.drawerNotificationIc,
              'Notification',
              trailing: CustomToggleSwitch(
                value: isNotificationOn,
                onChanged: (val) {
                  setState(() {
                    isNotificationOn = val;
                  });
                },
              ),
            ),
            SizedBox(height: 14.h),
            iconTextRow(AppIcons.aboutIc, 'About'),
            SizedBox(height: 14.h),
            iconTextRow(AppIcons.termsIc, 'Term & Conditions'),
            SizedBox(height: 20.h),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Image.asset(
                      AppIcons.securityIc,
                      height: 14.h,
                      width: 14.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  WidgetSpan(child: SizedBox(width: 4.w)),
                  TextSpan(
                    text: 'Term & Conditions. ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.clr141619.withOpacity(0.80),
                    ),
                  ),
                  TextSpan(
                    text: 'Read Now',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.clr2388FF,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconTextRow(
    final String image,
    final String title, {
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image, height: 22.h, width: 22.w, fit: BoxFit.cover),
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.clr19213D,
            ),
          ),
          if (trailing != null) ...[Spacer(), trailing],
        ],
      ),
    );
  }
}
