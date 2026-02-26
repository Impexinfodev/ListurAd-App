import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({super.key});

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Archive'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Icon(Icons.watch_later_outlined, size: 20.sp, color: AppColors.clr687684),
                SizedBox(width: 6.w),
                Text(
                  'Select Duration ',
                  style: TextStyle(
                    color: AppColors.clr687684,
                    fontFamily: AppFonts.medium,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 43.h),
            startDropdown<String>(
              labelText: "Start",
              hintText: "Tuesday, 2025 Mar 1",
              items: ["One", "Two", "Three"],
              selectedValue: selectedValue,
              onChanged: (val) {
                setState(() {
                  selectedValue = val;
                });
              },
              itemLabel: (item) => item,
            ),
            SizedBox(height: 22.h),
            startDropdown<String>(
              labelText: "End",
              hintText: "Wednesday, 2025 Aug 2",
              items: ["One", "Two", "Three"],
              selectedValue: selectedValue,
              onChanged: (val) {
                setState(() {
                  selectedValue = val;
                });
              },
              itemLabel: (item) => item,
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: .bottomRight,
              child: Text(
                'Total Charges:  ₹1599/- ',
                style: TextStyle(
                  color: AppColors.clr141619,
                  fontFamily: AppFonts.medium,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(height: 26.h),
            CustomButton(buttonName: 'Pay ₹1599/-', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget startDropdown<T>({
    String? labelText,
    required String hintText,
    required List<T> items,
    T? selectedValue,
    required ValueChanged<T?> onChanged,
    required String Function(T) itemLabel,
    double? width,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.medium,
                color: AppColors.clr2388FF.withOpacity(0.70),
              ),
            ),
          ),
        if (labelText != null) SizedBox(height: 5.h),

        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            value: selectedValue,
            hint: Text(
              hintText,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: AppFonts.regular,
                color: AppColors.clr687684.withOpacity(0.80),
                fontWeight: FontWeight.w500,
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  itemLabel(item),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.clr687684,
                    fontFamily: AppFonts.regular,
                  ),
                ),
              );
            }).toList(),
            onChanged: enabled ? onChanged : null,
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 26.sp,
                color: AppColors.clr687684,
              ),
            ),
            buttonStyleData: ButtonStyleData(
              height: 40.h,
              width: width ?? double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clr2388FF.withOpacity(0.20),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200.h,
              scrollPadding: EdgeInsets.only(bottom: 10.h),
              offset: const Offset(0, -3),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget endDropdown<T>({
    String? labelText,
    required String hintText,
    required List<T> items,
    T? selectedValue,
    required ValueChanged<T?> onChanged,
    required String Function(T) itemLabel,
    double? width,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.medium,
                color: AppColors.clr2388FF.withOpacity(0.70),
              ),
            ),
          ),
        if (labelText != null) SizedBox(height: 5.h),

        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            value: selectedValue,
            hint: Text(
              hintText,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: AppFonts.regular,
                color: AppColors.clr687684.withOpacity(0.80),
                fontWeight: FontWeight.w500,
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  itemLabel(item),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.clr687684,
                    fontFamily: AppFonts.regular,
                  ),
                ),
              );
            }).toList(),
            onChanged: enabled ? onChanged : null,
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 26.sp,
                color: AppColors.clr687684,
              ),
            ),
            buttonStyleData: ButtonStyleData(
              height: 40.h,
              width: width ?? double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clr2388FF.withOpacity(0.20),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200.h,
              scrollPadding: EdgeInsets.only(bottom: 10.h),
              offset: const Offset(0, -3),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
