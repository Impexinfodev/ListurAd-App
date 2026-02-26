import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_toggle_switch.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/payment/model/payment_history_model.dart';
import 'package:list_ur_add/widgets/home_widget/alert_sheet.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Notification', goHome: true,),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: .start,
              children: [
                Image.asset(AppIcons.profileIc, height: 48.h, width: 48.w, fit: BoxFit.contain),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Alert!!',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.medium,
                          color: AppColors.clr141619,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.regular,
                            color: AppColors.clr687684.withOpacity(0.90),
                          ),
                          children: [
                            const TextSpan(
                              text: "Boys PG Available at Vaishali Nagar, Jaipur Rajasthan. ",
                            ),
                            TextSpan(
                              text: "Connect Now?",
                              style: TextStyle(
                                fontFamily: AppFonts.regular,
                                fontSize: 14.sp,
                                color: AppColors.clr2388FF,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
