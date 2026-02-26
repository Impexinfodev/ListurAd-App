import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/modules/ad/model/payment_method_model.dart';
import 'package:list_ur_add/widgets/ad_widget/add_new_tile.dart';
import 'package:list_ur_add/widgets/ad_widget/payment_tile.dart';

class PaymentSection extends StatefulWidget {
  final String sectionTitle;
  final String sectionIcon;
  final List<PaymentMethodModel> methods;
  final String addButtonTitle;
  final VoidCallback onAddTap;
  final String? addButtonSubtitle;

  const PaymentSection({
    super.key,
    required this.sectionTitle,
    required this.sectionIcon,
    required this.methods,
    required this.addButtonTitle,
    required this.onAddTap,
    this.addButtonSubtitle,
  });

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    final int itemCount = widget.methods.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(widget.sectionIcon, height: 25.h, width: 25.w),
            SizedBox(width: 6.w),
            Text(
              widget.sectionTitle,
              style: TextStyle(
                fontFamily: AppFonts.semibold,
                fontSize: 16.sp,
                color: AppColors.clr19213D,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.clrD9D9D9),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount + 1,
            itemBuilder: (context, index) {
              final bool isAdd = index == itemCount;
              final bool isExpanded = expandedIndex == index;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: isAdd
                        ? AddNewTile(
                            title: widget.addButtonTitle,
                            subtitle: widget.addButtonSubtitle,
                            onTap: widget.onAddTap,
                          )
                        : PaymentTile(
                            model: widget.methods[index],
                            isExpanded: isExpanded,
                            onTap: () {
                              setState(() {
                                expandedIndex = isExpanded ? null : index;
                              });
                            },
                          ),
                  ),
                  if (index < itemCount)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: DottedLine(dashColor: AppColors.clrD9D9D9),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
