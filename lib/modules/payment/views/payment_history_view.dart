import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_toggle_switch.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/payment/model/payment_history_model.dart';
import 'package:list_ur_add/widgets/home_widget/alert_sheet.dart';

class PaymentHistoryView extends StatefulWidget {
  const PaymentHistoryView({super.key});

  @override
  State<PaymentHistoryView> createState() => _PaymentHistoryViewState();
}

class _PaymentHistoryViewState extends State<PaymentHistoryView> {
  final List<PaymentHistoryModel> paymentList = [
    PaymentHistoryModel(
      icon: AppIcons.paymentAddIc,
      title: 'Paytm Added',
      date: 'Today, 2:15 PM',
      amount: 150.00,
    ),
    PaymentHistoryModel(
      icon: AppIcons.mastercardAddIc,
      title: 'Mastercard Added',
      date: 'Yesterday, 5:40 PM',
      amount: 320.00,
    ),
    PaymentHistoryModel(
      icon: AppIcons.withDrawIc,
      title: 'Withdrawal to Paytm',
      date: '20 Oct, 11:10 AM',
      amount: 150.00,
      isCredit: false,
    ),
    PaymentHistoryModel(
      icon: AppIcons.paymentAddIc,
      title: 'Paytm Added',
      date: 'Today, 2:15 PM',
      amount: 150.00,
    ),
    PaymentHistoryModel(
      icon: AppIcons.mastercardAddIc,
      title: 'Mastercard Added',
      date: 'Yesterday, 5:40 PM',
      amount: 320.00,
    ),
    PaymentHistoryModel(
      icon: AppIcons.withDrawIc,
      title: 'Withdrawal to Paytm',
      date: '20 Oct, 11:10 AM',
      amount: 150.00,
      isCredit: false,
    ),
    PaymentHistoryModel(
      icon: AppIcons.paymentAddIc,
      title: 'Paytm Added',
      date: 'Today, 2:15 PM',
      amount: 150.00,
    ),
    PaymentHistoryModel(
      icon: AppIcons.mastercardAddIc,
      title: 'Mastercard Added',
      date: 'Yesterday, 5:40 PM',
      amount: 320.00,
    ),
    PaymentHistoryModel(
      icon: AppIcons.withDrawIc,
      title: 'Withdrawal to Paytm',
      date: '20 Oct, 11:10 AM',
      amount: 150.00,
      isCredit: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Payment History',
        widget: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Image.asset(AppIcons.filterateIc, height: 16.h, width: 16.w, fit: BoxFit.cover),
        ),
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
            decoration: BoxDecoration(color: AppColors.clr2388FF.withOpacity(0.10)),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'October 2025',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: AppFonts.semibold,
                    color: AppColors.clr141619,
                  ),
                ),
                Column(
                  crossAxisAlignment: .end,
                  children: [
                    Text(
                      'Total Spent',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: AppFonts.medium,
                        color: AppColors.clr687684.withOpacity(0.80),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '+\$1,250.00',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: AppFonts.semibold,
                        color: AppColors.clr141619,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              itemCount: paymentList.length,
              itemBuilder: (context, index) {
                final item = paymentList[index];
                final bool isCredit = item.isCredit ?? true;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(item.icon, height: 32.h, width: 32.w, fit: BoxFit.contain),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: AppFonts.medium,
                                  color: AppColors.clr3D4F61,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                item.date,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppFonts.medium,
                                  color: AppColors.clr8E8E8E,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '${isCredit ? '+' : '-'}\$${item.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppFonts.medium,
                              color: isCredit ? AppColors.clr2388FF : AppColors.clrEE0E0E,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Divider(color: AppColors.clr687684.withOpacity(0.20)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
