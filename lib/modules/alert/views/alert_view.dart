import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_toggle_switch.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/widgets/home_widget/alert_sheet.dart';

class AlertView extends StatefulWidget {
  const AlertView({super.key});

  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  int selectedTab = 0;
  bool isToggle = false;
  bool isPrivacyAccepted = false;

  final List<String> tabs = ['All (10)', 'Active (5)', 'Paused (2)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Alert'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Alerts',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontFamily: AppFonts.medium,
                        color: AppColors.clr141619,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '3 active alerts',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: AppFonts.regular,
                        color: AppColors.clr4B5563,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => AlertSheet.show(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 20.sp, color: Colors.white),
                        SizedBox(width: 6.w),
                        Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: AppFonts.medium,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            _customTabBar(),
            SizedBox(height: 20.h),
            Expanded(child: _tabContent()),
          ],
        ),
      ),
    );
  }

  Widget _customTabBar() {
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedTab == index;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = index;
              });
            },
            child: AnimatedContainer(
              height: 35.h,
              width: 70.w,
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clrB5B5B5.withOpacity(0.20),
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
                color: isSelected ? AppColors.clr2388FF.withOpacity(0.20) : AppColors.clrF7F7F7,
                borderRadius: BorderRadius.circular(120.r),
              ),
              child: Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.medium,
                    color: isSelected ? AppColors.clr0067FF : AppColors.clr687684,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _tabContent() {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return _alertCard();
      },
    );
  }

  Widget _alertCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 2.w, right: 2.w, top: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.clr687684.withOpacity(0.20),
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: .start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPrivacyAccepted = !isPrivacyAccepted;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                  height: 16.h,
                  width: 16.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    border: Border.all(width: 1.4.w, color: AppColors.clr687684),
                  ),
                  child: isPrivacyAccepted
                      ? Icon(Icons.check, size: 12.sp, color: AppColors.clr687684)
                      : null,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Transform.translate(
                            offset: Offset(0, -3.h),
                            child: Text(
                              'Senior React Developer',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: AppFonts.medium,
                                color: AppColors.clr141619,
                              ),
                            ),
                          ),
                        ),
                        CustomToggleSwitch(
                          value: isToggle,
                          onChanged: (val) {
                            setState(() {
                              isToggle = val;
                            });
                          },
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.clr2388FF.withOpacity(0.30),
                                blurRadius: 6,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Image.asset(AppIcons.editIc, height: 10.h, width: 10.w, fit: BoxFit.cover),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _iconTextRow(iconPath: AppIcons.bagIc, text: 'Full-time • IT Solutions'),
                    SizedBox(height: 14.h),
                    _iconTextRow(iconPath: AppIcons.developmentIc, text: 'Software Development'),
                    SizedBox(height: 14.h),
                    _iconTextRow(iconPath: AppIcons.locationFillIc, text: 'Jaipur, Rajasthan India'),
                    SizedBox(height: 18.h),
                    Divider(color: AppColors.clrD9D9D9.withOpacity(0.20), height: 2.h),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Created 2 days ago',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.regular,
                              color: AppColors.clr4B5563,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                          decoration: BoxDecoration(
                            color: AppColors.clr1AFF05.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 6.h,
                                width: 6.w,
                                decoration: BoxDecoration(color: AppColors.clr32F421, shape: BoxShape.circle),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Active',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: AppFonts.medium,
                                  color: AppColors.clr115E0A,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget _iconTextRow({
    required String iconPath,
    required String text,
    double iconHeight = 13,
    double iconWidth = 17,
    Color textColor = AppColors.clr4B5563,
    double spacing = 5,
  }) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          height: iconHeight.h,
          width: iconWidth.w,
          fit: BoxFit.contain,
        ),
        SizedBox(width: spacing.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppFonts.medium,
            color: textColor,
          ),
        ),
      ],
    );
  }

}
