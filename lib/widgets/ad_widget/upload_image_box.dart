import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';

class UploadImageBox extends StatefulWidget {
  final VoidCallback? onUploadTap;
  final VoidCallback? onRemove;

  const UploadImageBox({super.key, this.onUploadTap, this.onRemove});

  @override
  State<UploadImageBox> createState() => _UploadImageBoxState();
}

class _UploadImageBoxState extends State<UploadImageBox> {
  File? selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
      if (widget.onUploadTap != null) widget.onUploadTap!();
    }
  }

  void removeImage() {
    setState(() {
      selectedImage = null;
    });
    if (widget.onRemove != null) widget.onRemove!();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            dashPattern: [10, 5],
            strokeWidth: 1.5,
            color: AppColors.clrD9D9D9,
            radius: Radius.circular(22.r),
          ),
          child: Container(
            width: double.infinity,
            height: 220.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.r),
              child: selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppIcons.uploadIc, height: 36.h, width: 36.w),
                        SizedBox(height: 12.h),
                        Text(
                          'Upload Picture',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.clr687684,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Max Size 2MB',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.clr687684.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          '(JPG, PNG)',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.clr687684.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),

        Positioned(
          bottom: -18.h,
          child: CustomButton(
            padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 3.h),
            backgroundColor: Colors.white,
            borderColor: AppColors.clr2388FF,
            buttonName: selectedImage != null ? 'Change' : 'Upload',
            textColor: AppColors.clr2388FF,
            onPressed: selectedImage != null ? pickImage : pickImage,
          ),
        ),
      ],
    );
  }
}
