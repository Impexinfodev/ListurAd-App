import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';

class DynamicAdWidget extends StatelessWidget {
  final AdLayoutType? layoutType;
  final String profileName;
  final String? profileImage;
  final bool isVerified;
  final bool showFollow;
  final String? postImage;
  final String? postText;
  final String? adColorCode;
  final String phoneNumber;

  const DynamicAdWidget({
    super.key,
    this.layoutType,
    required this.profileName,
    this.profileImage,
    this.isVerified = false,
    this.showFollow = false,
    this.postImage,
    this.postText,
    this.adColorCode,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.20), blurRadius: 2)],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35.r),
                child: profileImage != null
                    ? Image.network(profileImage!, height: 35.h, width: 35.h, fit: BoxFit.cover)
                    : Image.asset(AppIcons.profileIc, height: 35.h, width: 35.h, fit: BoxFit.cover),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          profileName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.semibold,
                            color: AppColors.clr141619,
                          ),
                        ),
                        if (isVerified) ...[
                          SizedBox(width: 6.w),
                          Image.asset(AppIcons.verifyIc, height: 15.h, width: 15.w),
                        ],
                        if (showFollow) ...[
                          SizedBox(width: 8.w),
                          Text(
                            '• Follow',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.semibold,
                              color: AppColors.clr2388FF,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 6.h),

                    // Nullable safe
                    if (layoutType != null) buildAdContent() else const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.wifi_calling_3_outlined, color: AppColors.clr2388FF, size: 20.sp),
              SizedBox(width: 11.w),
              Expanded(
                child: Text(
                  phoneNumber,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.semibold,
                    color: AppColors.clr141619,
                  ),
                ),
              ),
              Icon(Icons.edit_outlined, size: 20.sp),
              SizedBox(width: 4.w),
              Text(
                'Edit',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppFonts.semibold,
                  color: AppColors.clr141619,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    if (postImage == null) return const SizedBox();
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Image.asset(postImage!, height: 200.h, width: double.infinity, fit: BoxFit.cover),
    );
  }

  Widget buildText() {
    if (postText == null || postText!.isEmpty) return const SizedBox();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: getAdBackgroundColor(),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        postText!,
        style: TextStyle(color: AppColors.clr141619, fontSize: 16.sp, fontFamily: AppFonts.regular),
      ),
    );
  }

  Widget buildAdContent() {
    if (layoutType == null) return const SizedBox();

    switch (layoutType!) {
      case AdLayoutType.imageOnly:
        return buildImage();

      case AdLayoutType.textOnly:
      case AdLayoutType.yellowText:
      case AdLayoutType.pinkText:
        return buildText();

      case AdLayoutType.imageWithText:
        return Column(
          children: [
            buildImage(),
            SizedBox(height: 6.h),
            buildText(),
          ],
        );

      case AdLayoutType.textWithImage:
        return Column(
          children: [
            buildText(),
            SizedBox(height: 6.h),
            buildImage(),
          ],
        );

      case AdLayoutType.imageWithTextLayoutLeft:
        final imageWidth = 154.w;
        final imageHeight = 178.h;
        final spacing = 6.w;

        final textStyle = TextStyle(
          fontSize: 14.sp,
          fontFamily: AppFonts.regular,
          height: 1.4,
          color: AppColors.clr141619,
        );

        return LayoutBuilder(
          builder: (context, constraints) {
            final availableTextWidth = constraints.maxWidth - imageWidth - spacing;

            final fullText = postText ?? '';

            final sideText = _getFittingText(
              text: fullText,
              style: textStyle,
              maxWidth: availableTextWidth,
              maxHeight: imageHeight,
            );

            final belowText = fullText.substring(sideText.length);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: imageWidth, height: imageHeight, child: buildImage()),
                    SizedBox(width: spacing),
                    Expanded(child: Text(sideText, style: textStyle)),
                  ],
                ),

                if (belowText.isNotEmpty) ...[Text(belowText, style: textStyle)],
              ],
            );
          },
        );

      case AdLayoutType.imageWithTextLayoutRight:
        final imageWidth = 154.w;
        final imageHeight = 178.h;
        final spacing = 6.w;

        final textStyle = TextStyle(
          fontSize: 14.sp,
          fontFamily: AppFonts.regular,
          height: 1.4,
          color: AppColors.clr141619,
        );

        return LayoutBuilder(
          builder: (context, constraints) {
            final availableTextWidth = constraints.maxWidth - imageWidth - spacing;
            final fullText = postText ?? '';
            final sideText = _getFittingText(
              text: fullText,
              style: textStyle,
              maxWidth: availableTextWidth,
              maxHeight: imageHeight,
            );
            final belowText = fullText.substring(sideText.length);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(sideText, style: textStyle)),
                    SizedBox(width: spacing),
                    SizedBox(width: imageWidth, height: imageHeight, child: buildImage()),
                  ],
                ),
                if (belowText.isNotEmpty) ...[
                  SizedBox(height: 4.h),
                  Text(belowText, style: textStyle),
                ],
              ],
            );
          },
        );
    }
  }

  Color getAdBackgroundColor() {
    if (adColorCode == null) return Colors.white;

    switch (adColorCode) {
      case 'E3F300':
        return AppColors.clrE3F300.withOpacity(0.50);
      case 'FF81E4':
        return AppColors.clrFF81E4.withOpacity(0.50);
      default:
        return Colors.white;
    }
  }

  String _getFittingText({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required double maxHeight,
  }) {
    final tp = TextPainter(textDirection: TextDirection.ltr, maxLines: null);

    int low = 0;
    int high = text.length;

    while (low < high) {
      final mid = (low + high + 1) ~/ 2;

      tp.text = TextSpan(text: text.substring(0, mid), style: style);
      tp.layout(maxWidth: maxWidth);

      if (tp.height <= maxHeight) {
        low = mid;
      } else {
        high = mid - 1;
      }
    }

    return text.substring(0, low);
  }
}
