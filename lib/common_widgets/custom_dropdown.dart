import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabel;
  final double? width;
  final bool enabled;

  const CustomDropdown({
    super.key,
    this.labelText,
    required this.hintText,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.itemLabel,
    this.width,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.medium,
              color: AppColors.clr141619,
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
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
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

