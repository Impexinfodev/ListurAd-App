import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/constant/app_images.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/modules/ad/views/payment_view.dart';
import 'package:list_ur_add/routes/routes.dart';
import 'package:list_ur_add/widgets/ad_widget/coupon_sheet.dart';
import 'package:list_ur_add/widgets/ad_widget/dynamic_ad_widget.dart';
import 'package:list_ur_add/widgets/ad_widget/payment_summary_widget.dart';

class ImageWithTextView extends StatefulWidget {
  final AdLayoutType layoutType;

  const ImageWithTextView({super.key, required this.layoutType});

  @override
  State<ImageWithTextView> createState() => _ImageWithTextViewState();
}

class _ImageWithTextViewState extends State<ImageWithTextView> {
  bool isCouponApplied = false;
  double discountAmount = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Ad Preview'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        child: Column(
          children: [
            DynamicAdWidget(
              layoutType: widget.layoutType,
              profileName: 'Rahul Sharma',
              profileImage: null,
              postImage: AppImages.addImg,
              isVerified: true,
              showFollow: true,
              postText:
                  'We are seeking a creative Frontend Developer with expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications, expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications. Salary: ₹15–25 LPA. Full-time, flexible work options. Apply at hr@gmail.com.',
              adColorCode: null,
              phoneNumber: '+91 9785212456',
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [BoxShadow(color: Color(0xFF000000).withOpacity(0.20), blurRadius: 2)],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: .center,
                    children: [
                      Image.asset(AppIcons.couponIc, height: 30.h, width: 30.h, fit: BoxFit.cover),
                      SizedBox(width: 5.w),
                      Text(
                        'Apply Discount % Coupons',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.semibold,
                          color: AppColors.clr141619,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(borderCl: AppColors.clrADCEFF, borderWidth: 1.5.w),
                      ),
                      SizedBox(width: 6.w),
                      CustomButton(
                        buttonName: 'Apply',
                        onPressed: () {
                          setState(() {
                            isCouponApplied = true;
                          });
                        },
                        width: 108.w,
                        backgroundColor: AppColors.clr2388FF,
                      ),
                    ],
                  ),
                  if (isCouponApplied) ...[
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.clr2DC70E.withOpacity(0.20),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.check, size: 10.sp, color: AppColors.clr2DC70E),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Coupon applied successfully! You saved ₹$discountAmount',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.clr2DC70E,
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      CouponSheet.show(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          'View Available Coupons',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.clr2388FF,
                          ),
                        ),
                        SizedBox(width: 9.w),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.clr787878,
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            PaymentSummaryWidget(
              originalAmount: 650.0,
              isCouponApplied: isCouponApplied,
              discountAmount: discountAmount,
            ),
            SizedBox(height: 80.h),
            CustomButton(
              buttonName: 'Payment ₹600',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentView(layoutType: widget.layoutType),
                  ),
                );
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
