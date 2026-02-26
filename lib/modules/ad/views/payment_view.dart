import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/modules/ad/model/payment_method_model.dart';
import 'package:list_ur_add/widgets/ad_widget/payment_section.dart';

class PaymentView extends StatefulWidget {
  final AdLayoutType? layoutType;

  const PaymentView({super.key, this.layoutType});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int? expandedIndex;
  final int cardCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment'),
      backgroundColor: AppColors.clrF7F7F7,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentSection(
              sectionTitle: "Credit & Debit Cards",
              sectionIcon: AppIcons.creditCarIc,
              addButtonTitle: "Add New Card",
              addButtonSubtitle: "Save and pay faster",
              onAddTap: () {},
              methods: [
                PaymentMethodModel(
                  type: PaymentMethodType.card,
                  title: "Axis Bank Card",
                  maskedNumber: "•••• 1234",
                  icon: AppIcons.bankIc,
                  helperText: "CVV is not needed for MASTERCARD cards saved as per RBI guideliness",
                  subtitle: "",
                ),
              ],
            ),
            SizedBox(height: 30.h),
            PaymentSection(
              sectionTitle: "Pay by any UPI App",
              sectionIcon: AppIcons.upiIc,
              addButtonTitle: "Add New UPI ID",
              onAddTap: () {},
              methods: [
                PaymentMethodModel(
                  type: PaymentMethodType.upi,
                  title: "Paytm UPI",
                  icon: AppIcons.paytmUpiIc,
                  helperText:
                      "Assured cashback on payments above 150/- & Paytm vouchers upto  200/-",
                  subtitle: "",
                ),
              ],
            ),
            SizedBox(height: 30.h),
            PaymentSection(
              sectionTitle: "Preferred Payment",
              sectionIcon: AppIcons.prefPayIc,
              addButtonTitle: "Add New Card",
              addButtonSubtitle: "Save and pay faster",
              onAddTap: () {},
              methods: [
                PaymentMethodModel(
                  type: PaymentMethodType.card,
                  title: "Axis Bank Card",
                  maskedNumber: "•••• 1234",
                  icon: AppIcons.mastercardAddIc,
                  helperText: "CVV is not needed for MASTERCARD cards saved as per RBI guideliness",
                  subtitle: "",
                ),
                PaymentMethodModel(
                  type: PaymentMethodType.upi,
                  title: "Paytm UPI",
                  icon: AppIcons.paytmUpiIc,
                  helperText:
                      "Assured cashback on payments above 150/- & Paytm vouchers upto  200/-",
                  subtitle: "",
                ),
              ],
            ),
            SizedBox(height: 30.h),
            PaymentSection(
              sectionTitle: "Wallet & More Payment Options",
              sectionIcon: AppIcons.sectionWalletIc,
              addButtonTitle: "Add New Card",
              addButtonSubtitle: "Save and pay faster",
              onAddTap: () {},
              methods: [
                PaymentMethodModel(
                  type: PaymentMethodType.wallet,
                  title: "Wallet",
                  icon: AppIcons.bankWalletIc,
                  helperText:
                      "Assured cashback on payments above 150/- & Paytm vouchers upto  200/-",
                  subtitle: "",
                ),
                PaymentMethodModel(
                  type: PaymentMethodType.netBanking,
                  title: "Net Banking",
                  icon: AppIcons.paytmUpiIc,
                  helperText: "Select your bank from list of bank",
                  subtitle: "",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
