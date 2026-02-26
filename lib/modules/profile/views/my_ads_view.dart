import 'package:flutter/material.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/constant/app_images.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/widgets/ad_widget/job_post_widget.dart';

class MyAdsView extends StatefulWidget {
  const MyAdsView({super.key});

  @override
  State<MyAdsView> createState() => _MyAdsViewState();
}

class _MyAdsViewState extends State<MyAdsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            JobPostWidget(
              layoutType: AdLayoutType.imageWithTextLayoutLeft,
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
          ],
        ),
      ),
    );
  }
}
