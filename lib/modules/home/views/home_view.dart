import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_drawer.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/constant/app_images.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/widgets/ad_widget/job_post_widget.dart';
import 'package:list_ur_add/widgets/home_widget/action_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = ['Category', 'Sub Category', 'Type Category'];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              JobPostWidget(
                layoutType: AdLayoutType.textOnly,
                profileName: 'Viraj Sharma',
                profileImage: AppIcons.profileIc,
                isVerified: true,
                jobTitle: 'We’re Hiring Python Developer',
                location: 'Vaishali Nagar',
                ctc: 'Up to ₹12 LPA',
                experience: '3+ years',
                description:
                    'We are seeking a creative Frontend Developer with expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications, expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications. Salary: ₹15–25 LPA. Full-time, flexible work options. Apply at hr@gmail.com.',
                email: 'hr@company.com',
                likes: 3,
                comments: 5,
                calls: 2,
                analysis: '15k',
                isBookmarked: false,
                isShared: true,
                isTranslated: true,
              ),
              JobPostWidget(
                layoutType: AdLayoutType.pinkText,
                profileName: 'Viraj Sharma',
                profileImage: AppIcons.profileIc,
                isVerified: true,
                jobTitle: 'We’re Hiring Python Developer',
                location: 'Vaishali Nagar',
                ctc: 'Up to ₹12 LPA',
                experience: '3+ years',
                description:
                    'We are seeking a creative Frontend Developer with expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications, expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications. Salary: ₹15–25 LPA. Full-time, flexible work options. Apply at hr@gmail.com.',
                email: 'hr@company.com',
                likes: 3,
                comments: 5,
                showFollow: true,
                calls: 2,
                analysis: '15k',
                isBookmarked: false,
                isShared: true,
                isTranslated: true,
              ),
              JobPostWidget(
                layoutType: AdLayoutType.yellowText,
                profileName: 'Viraj Sharma',
                profileImage: AppIcons.profileIc,
                isVerified: true,
                jobTitle: 'We’re Hiring Python Developer',
                location: 'Vaishali Nagar',
                ctc: 'Up to ₹12 LPA',
                experience: '3+ years',
                description:
                    'We are seeking a creative Frontend Developer with expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications, expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications. Salary: ₹15–25 LPA. Full-time, flexible work options. Apply at hr@gmail.com.',
                email: 'hr@company.com',
                likes: 3,
                comments: 5,
                calls: 2,
                analysis: '15k',
                isBookmarked: false,
                isShared: true,
                isTranslated: true,
              ),
              JobPostWidget(
                layoutType: AdLayoutType.imageWithTextLayoutRight,
                profileName: 'Viraj Sharma',
                profileImage: AppIcons.profileIc,
                postImage: AppImages.addImg,
                isVerified: true,
                jobTitle: 'We’re Hiring Python Developer',
                location: 'Vaishali Nagar',
                ctc: 'Up to ₹12 LPA',
                experience: '3+ years',
                description:
                    'We are seeking a creative Frontend Developer with expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications, expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications. Salary: ₹15–25 LPA. Full-time, flexible work options. Apply at hr@gmail.com.',
                email: 'hr@company.com',
                likes: 3,
                comments: 5,
                calls: 2,
                analysis: '15k',
                isBookmarked: false,
                isSponsored: true,
                showFollow: true,
                isShared: true,
                isTranslated: true,
              ),
              JobPostWidget(
                layoutType: AdLayoutType.imageWithTextLayoutLeft,
                profileName: 'Viraj Sharma',
                profileImage: AppIcons.profileIc,
                postImage: AppImages.addImg,
                isVerified: true,
                jobTitle: 'We’re Hiring Python Developer',
                location: 'Vaishali Nagar',
                ctc: 'Up to ₹12 LPA',
                experience: '3+ years',
                description:
                    'We are seeking a creative Frontend Developer with expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications, expertise in React, Next.js, HTML, CSS, and JavaScript to build responsive and dynamic web applications. Salary: ₹15–25 LPA. Full-time, flexible work options. Apply at hr@gmail.com.',
                email: 'hr@company.com',
                likes: 3,
                comments: 5,
                calls: 2,
                analysis: '15k',
                showFollow: true,
                isSponsored: true,
                isBookmarked: false,
                isShared: true,
                isTranslated: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
