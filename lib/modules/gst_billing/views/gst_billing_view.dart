import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/common_widgets/custom_toggle_switch.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/payment/model/payment_history_model.dart';
import 'package:list_ur_add/widgets/home_widget/alert_sheet.dart';

class GstBillingView extends StatefulWidget {
  const GstBillingView({super.key});

  @override
  State<GstBillingView> createState() => _GstBillingViewState();
}

class _GstBillingViewState extends State<GstBillingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'GST Billing'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 28.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomTextField(
              borderCl: AppColors.clr2388FF.withOpacity(0.70),
              borderRadius: 14.r,
              hintText: 'Name of Firm',
              borderWidth: 1.w,
              hintColor: AppColors.clr2388FF.withOpacity(0.70),
            ),
            SizedBox(height: 18.h),
            CustomTextField(
              borderCl: AppColors.clr2388FF.withOpacity(0.70),
              borderRadius: 14.r,
              hintText: 'Name of Owner',
              borderWidth: 1.w,
              hintColor: AppColors.clr2388FF.withOpacity(0.70),
            ),
            SizedBox(height: 18.h),
            CustomTextField(
              borderCl: AppColors.clr2388FF.withOpacity(0.70),
              borderRadius: 14.r,
              hintText: 'GST No',
              borderWidth: 1.w,
              hintColor: AppColors.clr2388FF.withOpacity(0.70),
            ),
            SizedBox(height: 18.h),
            CustomTextField(
              borderCl: AppColors.clr2388FF.withOpacity(0.70),
              borderRadius: 14.r,
              hintText: 'Firm Address',
              borderWidth: 1.w,
              hintColor: AppColors.clr2388FF.withOpacity(0.70),
            ),
            SizedBox(height: 26.h),
            CustomButton(buttonName: 'Add Billing Address', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
