import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class PaymentSummaryWidget extends StatelessWidget {
  final double originalAmount;
  final bool isCouponApplied;
  final double discountAmount;

  const PaymentSummaryWidget({
    super.key,
    required this.originalAmount,
    this.isCouponApplied = false,
    this.discountAmount = 0,
  });

  double get totalPayable {
    return originalAmount - (isCouponApplied ? discountAmount : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Color(0xFF000000).withOpacity(0.20), blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.clr19213D,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Original Amount',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: AppFonts.regular,
                  color: AppColors.clr464646,
                ),
              ),
              Text(
                '₹${originalAmount.toStringAsFixed(2)}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: AppFonts.regular,
                  color: AppColors.clr464646,
                ),
              ),
            ],
          ),
          if (isCouponApplied) ...[
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount %',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: AppFonts.regular,
                    color: AppColors.clr2DC70E,
                  ),
                ),
                Text(
                  '-₹${discountAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: AppFonts.regular,
                    color: AppColors.clr2DC70E,
                  ),
                ),
              ],
            ),
          ],
          SizedBox(height: 16.h),
          DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: AppColors.clr687684.withOpacity(0.60),
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Payable',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: AppFonts.semibold,
                  color: AppColors.clr19213D,
                ),
              ),
              Text(
                '₹${totalPayable.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: AppFonts.semibold,
                  color: AppColors.clr19213D,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
