import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/modules/ad/model/payment_method_model.dart';
import 'package:list_ur_add/modules/ad/views/success_view.dart';
import 'package:list_ur_add/routes/routes.dart';
import 'package:list_ur_add/widgets/ad_widget/selection_circle.dart';

class PaymentTile extends StatelessWidget {
  final PaymentMethodModel model;
  final bool isExpanded;
  final VoidCallback onTap;
  final AdLayoutType? layoutType;

  const PaymentTile({
    super.key,
    required this.model,
    required this.isExpanded,
    required this.onTap,
    this.layoutType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(model.icon ?? AppIcons.bankIc, height: 25.h, width: 25.w),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                        fontFamily: AppFonts.medium,
                        fontSize: 14.sp,
                        color: AppColors.clr19213D,
                      ),
                    ),
                    if (model.type == PaymentMethodType.card && model.maskedNumber != null) ...[
                      SizedBox(width: 6.w),
                      SizedBox(
                        height: 18.h,
                        child: VerticalDivider(
                          width: 2.w,
                          thickness: 2,
                          color: AppColors.clrD9D9D9.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        model.maskedNumber!,
                        style: TextStyle(
                          fontFamily: AppFonts.medium,
                          fontSize: 14.sp,
                          color: AppColors.clr19213D,
                        ),
                      ),
                    ],
                    const Spacer(),
                    SelectionCircle(isSelected: isExpanded),
                  ],
                ),

                if (isExpanded) ...[
                  SizedBox(height: 10.h),
                  CustomButton(
                    buttonName: "Pay ₹599/-",
                    onPressed: () {
                      showVerifiedOverlay(context, layoutType);
                    },
                  ),
                ],

                if (model.helperText != null)
                  if (model.helperText != null)
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        model.helperText!,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.medium,
                          color:
                              (model.type == PaymentMethodType.upi ||
                                  model.type == PaymentMethodType.wallet)
                              ? AppColors.clr2388FF
                              : AppColors.clr687684,
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showVerifiedOverlay(BuildContext context, AdLayoutType? layoutType) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SuccessView(layoutType: layoutType)),
          );
        });

        return Center(
          child: Container(
            width: 192.w,
            height: 158.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.clrF0F7FF),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.clr2388FF.withOpacity(0.30),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppIcons.checkIc, height: 100.h, width: 100.w, fit: BoxFit.contain),
                Text(
                  "Payment Done",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: AppFonts.semibold,
                    color: AppColors.clr2388FF,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
