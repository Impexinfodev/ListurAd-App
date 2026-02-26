import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list_ur_add/common_widgets/column_spacer.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';

class MediaSourcePicker extends StatelessWidget {
  const MediaSourcePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.dm),
      child: ColumnSpacer(
        spacerWidget: SizedBox(height: 12.h),
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     InkWell(
          //       onTap: () {},
          //       child: const Icon(Icons.close),
          //     )
          //   ],
          // ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(ImageSource.gallery);
            },
            child: Row(
              children: [
                Image.asset(AppIcons.galleryIc, height: 22.h, width: 22.w, fit: BoxFit.contain),
                SizedBox(width: 15.w),
                Text(
                  "Upload from Gallery",
                  style: TextStyle(
                    color: const Color(0xFF1B1B1B),
                    fontSize: 14.sp,
                    fontFamily: AppFonts.semibold,
                    height: 0.10,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(ImageSource.camera);
            },
            child: Row(
              children: [
                Image.asset(AppIcons.cameraIc, height: 24.h, width: 24.w, fit: BoxFit.cover),
                SizedBox(width: 15.w),
                Text(
                  "Take a picture",
                  style: TextStyle(
                    color: const Color(0xFF1B1B1B),
                    fontSize: 14.sp,
                    fontFamily: AppFonts.semibold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
