import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/phone_number_field.dart';
import 'package:list_ur_add/common_widgets/single_select_location_dropdown.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/modules/ad/views/image_with_text_view.dart';
import 'package:list_ur_add/widgets/ad_widget/custom_date_field.dart';
import 'package:list_ur_add/widgets/ad_widget/rich_message_box.dart';
import 'package:list_ur_add/widgets/ad_widget/upload_image_box.dart';
import 'package:list_ur_add/widgets/home_widget/custom_calendar_widget.dart';

class AdImageDesignView extends StatefulWidget {
  final AdLayoutType layoutType;

  const AdImageDesignView({super.key, required this.layoutType});

  @override
  State<AdImageDesignView> createState() => _AdImageDesignViewState();
}

class _AdImageDesignViewState extends State<AdImageDesignView> {
  TextEditingController phoneController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    endDate = DateTime.now();
  }

  String formatDate(DateTime? date) {
    if (date == null) return '--/--/----';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Design AD'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomDateInputField(
                    title: 'Start Date',
                    date: startDate,
                    onTap: () {
                      openCalendar(
                        initialDate: startDate ?? DateTime.now(),
                        onSelected: (d) {
                          setState(() => startDate = d);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomDateInputField(
                    title: 'End Date',
                    date: endDate,
                    onTap: () {
                      openCalendar(
                        initialDate: endDate ?? DateTime.now(),
                        onSelected: (d) {
                          setState(() => endDate = d);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SingleSelectLocationDropdown(
              label: 'Select Location',
              labelTextStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: AppFonts.medium,
                color: AppColors.clr687684,
              ),
              hintText: 'Select Your location to live',
              hintTextStyle: TextStyle(
                fontSize: 18.sp,
                fontFamily: AppFonts.regular,
                color: AppColors.clr2388FF,
              ),
              widget: Image.asset(
                AppIcons.locationOnIc,
                height: 22.h,
                width: 22.w,
                fit: BoxFit.contain,
              ),
              labelWidget: Image.asset(
                AppIcons.locationGrey,
                height: 19.h,
                width: 19.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30.h),
            UploadImageBox(onUploadTap: () {}, onRemove: () {}),
            SizedBox(height: 30.h),
            RichMessageBox(controller: TextEditingController()),
            SizedBox(height: 20.h),
            PhoneNumberField(
              controller: phoneController,
              hintText: "Enter Mobile Number",
              isPhoneNumber: true,
              validator: (value) {
                if (value == null || value.isEmpty) return "Required";
                return null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 30.h, horizontal: 16.w),
        child: CustomButton(
          buttonName: 'Proceed To Preview',
          leading1: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 15.sp),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ImageWithTextView(layoutType: widget.layoutType)),
            );
          },
        ),
      ),
    );
  }

  void openCalendar({required DateTime initialDate, required Function(DateTime) onSelected}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: CustomDatePicker(
            initialDate: initialDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onDateSelected: (date) {
              onSelected(date);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
