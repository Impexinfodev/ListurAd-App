import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/custom_dropdown.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/common_widgets/multiselect_location_dropdown.dart';
import 'package:list_ur_add/common_widgets/single_select_location_dropdown.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';

class AlertSheet {
  static show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.75,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.clr687684.withOpacity(0.2))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Alert',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: AppFonts.medium,
                          color: AppColors.clr141619,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, size: 24.sp),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: 'Alert Name',
                          hintText: 'Senior Frontend Developer',
                        ),
                        SizedBox(height: 22.h),
                        CustomDropdown(
                          labelText: 'Alert Category',
                          hintText: 'Job',
                          items: [],
                          selectedValue: null,
                          onChanged: (_) {},
                          itemLabel: (_) => 'Senior Frontend Developer',
                        ),
                        SizedBox(height: 22.h),
                        CustomDropdown(
                          labelText: 'Job Type',
                          hintText: 'Full Time',
                          items: [],
                          selectedValue: null,
                          onChanged: (_) {},
                          itemLabel: (_) => 'Full Time',
                        ),
                        SizedBox(height: 22.h),
                        CustomDropdown(
                          labelText: 'Industry',
                          hintText: 'IT-Solutions',
                          items: [],
                          selectedValue: null,
                          onChanged: (_) {},
                          itemLabel: (_) => 'IT-Solutions',
                        ),
                        SizedBox(height: 22.h),
                        CustomDropdown(
                          labelText: 'Job Role',
                          hintText: 'React Developer',
                          items: [],
                          selectedValue: null,
                          onChanged: (_) {},
                          itemLabel: (_) => 'React Developer',
                        ),
                        SizedBox(height: 22.h),
                        SingleSelectLocationDropdown(label: 'Location'),
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                backgroundColor: Colors.white,
                                buttonName: 'Cancel',
                                textColor: Colors.black,
                                borderRadius: 10.r,
                                onPressed: () => Navigator.pop(context),
                                boxShadowColor: AppColors.clr687684.withOpacity(0.10),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: CustomButton(
                                backgroundColor: AppColors.mainColor,
                                buttonName: 'Save',
                                borderRadius: 10.r,
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
