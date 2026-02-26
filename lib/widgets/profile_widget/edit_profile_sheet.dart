import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/constant/app_images.dart';
import 'package:list_ur_add/util/image_picker_utils.dart';
import 'package:list_ur_add/util/media_source_picker.dart';

class EditProfileSheet extends StatefulWidget {
  const EditProfileSheet({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const EditProfileSheet(),
    );
  }

  @override
  State<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
  File? profileImage;
  File? coverImage;

  Future<void> _pickImage({required bool isCover}) async {
    final value = await showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (_) => const MediaSourcePicker(),
    );

    if (value != null && value is ImageSource) {
      File? pickedFile = await PickImageUtility.instance(context: context).pickedFile(value);

      if (pickedFile != null) {
        setState(() {
          if (isCover) {
            coverImage = pickedFile;
          } else {
            profileImage = pickedFile;
          }
        });
      }
    }
  }

  Widget _divider() {
    return Divider(height: 1, thickness: 0.4, color: AppColors.clr90989B.withOpacity(0.60));
  }

  Widget _item(String title, String value, {bool isMulti = false}) {
    final controller = TextEditingController(text: value);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        crossAxisAlignment: isMulti ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 110.w,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.clr141619,
                fontFamily: AppFonts.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: isMulti ? null : 1,
              style: TextStyle(
                color: AppColors.clr2388FF,
                fontFamily: AppFonts.regular,
                fontSize: 16.sp,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              cursorColor: AppColors.clr2388FF,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColors.clr434445,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.medium,
                      ),
                    ),
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: AppColors.clr141619,
                      fontSize: 16.sp,
                      fontFamily: AppFonts.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Save Logic Here
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: AppColors.clr282828,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.semibold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: () => _pickImage(isCover: true),
                          child: Container(
                            height: 140.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: coverImage != null
                                    ? FileImage(coverImage!)
                                    : AssetImage(AppImages.imageCover) as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(AppIcons.photoUploadIc, height: 40.h, width: 40.w),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 110.h,
                          left: 16.w,
                          child: GestureDetector(
                            onTap: () => _pickImage(isCover: false),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 4.w),
                                color: AppColors.clr1289FF,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AppIcons.photoUploadIc, height: 40.h, width: 40.w),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70.h),
                    _divider(),
                    _item("Name", "Anurag Sharma"),
                    _divider(),
                    _item("Phone", "9876543231"),
                    _divider(),
                    _item(
                      "Bio",
                      "A Passionate UI/UX Designer with\n1.6 Years of Hands on Experience of\nDelivering Numerous Businesses\nSolutions.",
                      isMulti: true,
                    ),
                    _divider(),
                    _item("Gender", "Male"),
                    _divider(),
                    _item("Profession", "UI/UX Designer"),
                    _divider(),
                    _item("DOB", "01/01/2001"),
                    _divider(),
                    _item("Website", "anurag.io"),
                    _divider(),
                    _item("Address", "Vaishali Nagar, Jaipur, Raj 302021", isMulti: true),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
