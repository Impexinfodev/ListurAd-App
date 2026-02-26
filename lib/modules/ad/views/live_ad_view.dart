import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/constant/app_images.dart';
import 'package:list_ur_add/modules/ad/model/ad_content_model.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/widgets/ad_widget/job_post_widget.dart';
import 'package:list_ur_add/widgets/home_widget/action_icon.dart';

class LiveAdView extends StatefulWidget {
  final AdLayoutType? layoutType;

  const LiveAdView({super.key, this.layoutType});

  @override
  State<LiveAdView> createState() => _LiveAdViewState();
}

class _LiveAdViewState extends State<LiveAdView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Ad Live', goHome: true,),
      body: Column(
        children: [
          JobPostWidget(
            layoutType: AdLayoutType.yellowText,
            profileName: 'Viraj Sharma',
            profileImage: AppIcons.profileIc,
            isVerified: true,
            postImage: AppImages.addImg,
            jobTitle: 'We’re Hiring Python Developer',
            location: 'Vaishali Nagar',
            ctc: 'Up to ₹12 LPA',
            experience: '3+ years',
            description: 'We are seeking a creative Frontend Developer with expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications, expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications. Salary: ₹15–25 LPA. Full-time, flexible work options. Apply at hr@gmail.com.',
            email: 'hr@company.com', 
            likes: 3,
            comments: 5,
            calls: 2,
            analysis: '15k',
            isBookmarked: false,
            isShared: true,
            isTranslated: true,
          ),
          Divider(color: AppColors.clrCED5DC),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Note:',
                  style: TextStyle(
                    color: Color(0xFFF60B0B),
                    fontFamily: AppFonts.semibold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Your Ad is under review on approval it will be live on selected date. ',
                          style: TextStyle(
                            color: AppColors.clr141619,
                            fontFamily: AppFonts.medium,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'Read Term & Conditions',
                          style: TextStyle(
                            color: AppColors.clr2388FF,
                            fontFamily: AppFonts.medium,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
