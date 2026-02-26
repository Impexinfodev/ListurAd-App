import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';

class CategoryDialog extends StatelessWidget {
  final List<String> categories;
  final Function(String) onSelect;

  const CategoryDialog({super.key, required this.categories, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.clr2388FF.withOpacity(0.10),
              blurRadius: 10
            )
          ],
          border: Border.all(color: AppColors.clrE8E8E8, width: 2.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              leading: Icon(
                Icons.search,
                size: 20.sp,
                color: AppColors.clr2388FF.withOpacity(0.70),
              ),
              hintText: 'Select Your Category',
              // borderCl: AppColors.clrF1F3F7,
              hintColor: AppColors.clr2388FF.withOpacity(0.70),
            ),
            SizedBox(height: 10.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onSelect(categories[index]);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      border: Border.all(color: AppColors.clrF1F3F7, width: 1.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.clr687684.withOpacity(0.80),
                          ),
                        ),
                        Image.asset(
                          AppIcons.arrowUpIc,
                          height: 30.h,
                          width: 30.w,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
