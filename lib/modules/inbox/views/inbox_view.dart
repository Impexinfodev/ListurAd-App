import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/inbox/views/chat_view.dart';
import 'package:list_ur_add/routes/routes.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        goHome: true,
        title: 'Inbox',
        widget: Row(
          children: [
            Image.asset(AppIcons.searchIc, height: 20.h, width: 20.w, fit: BoxFit.contain),
            SizedBox(width: 16.w),
            Image.asset(AppIcons.menuIc, height: 20.h, width: 20.w, fit: BoxFit.contain),
            SizedBox(width: 16.w),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: .start,
              children: [
                Image.asset(AppIcons.profileIc, height: 55.h, width: 55.w, fit: BoxFit.contain),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Anishka Negi',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppFonts.medium,
                              color: AppColors.clr141619,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '• Groom Wanted',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.medium,
                              color: AppColors.clr2388FF,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '3m ago',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: AppFonts.regular,
                              color: AppColors.clr687684.withOpacity(0.80),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: AppColors.clr687684.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Text(
                              'Ad',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppFonts.regular,
                                color: AppColors.clr2388FF,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              overflow: .ellipsis,
                              maxLines: 1,
                              'Anshika Negi, Handsome Mathur 28 yrs/ 6’ 9 Girl',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppFonts.regular,
                                color: AppColors.clr8493A2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChatView()),
                              );
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AppIcons.profileIc,
                                      height: 25.h,
                                      width: 25.w,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 4.w),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6.w,
                                          vertical: 2.5.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.clr2388FF,
                                          borderRadius: BorderRadius.circular(5.r),
                                        ),
                                        child: Text(
                                          overflow: .ellipsis,
                                          maxLines: 1,
                                          'Hello Anshika, Anav Negi’s Father this side.',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppFonts.regular,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10.h),
                                if (index == 2)
                                  Divider(color: AppColors.clr687684.withOpacity(0.40)),
                              ],
                            ),
                          );
                        },
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
