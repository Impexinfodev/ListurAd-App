import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/dashboard/views/dashboard_view.dart';
import 'package:list_ur_add/modules/inbox/views/inbox_view.dart';
import 'package:list_ur_add/routes/slide_right_route.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? widget;
  final Widget? widget2;
  final bool goHome;
  final bool isInbox;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.widget,
    this.widget2,
    this.goHome = false,
    this.isInbox = false,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(55.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      automaticallyImplyLeading: false,
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (onBackPressed != null) {
                onBackPressed!();
              } else if (goHome) {
                Navigator.of(context).pushAndRemoveUntil(
                  SlideRightRoute(page: const DashboardView(index: 0)),
                  (route) => false,
                );
              } else if (isInbox) {
                Navigator.of(context).pushAndRemoveUntil(
                  SlideRightRoute(page: const DashboardView(index: 1)),
                  (route) => false,
                );
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Image.asset(
              AppIcons.arrowBackIc,
              width: 16.w,
              height: 16.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 22.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: AppFonts.semibold,
            ),
          ),
          ?widget2,
        ],
      ),
      actions: [widget ?? const SizedBox()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: AppColors.clr2388FF.withOpacity(0.10), blurRadius: 10)],
          ),
          height: 1.h,
        ),
      ),
    );
  }
}
