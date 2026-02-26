import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.clr17324D),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: AppFonts.bold,
            color: AppColors.clr17324D,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Introduction'),
            _sectionText(
              'List Ur Ad respects your privacy and is committed to protecting your personal information. '
                  'This Privacy Policy explains how we collect, use, and safeguard your data.',
            ),

            _sectionTitle('Information We Collect'),
            _sectionText(
              'We may collect personal information such as your name, email address, phone number, '
                  'and advertisement details when you use our services.',
            ),

            _sectionTitle('How We Use Your Information'),
            _sectionText(
              'Your information is used to provide and improve our services, '
                  'communicate with you, and ensure a secure user experience.',
            ),

            _sectionTitle('Data Security'),
            _sectionText(
              'We implement appropriate security measures to protect your data '
                  'from unauthorized access, alteration, or disclosure.',
            ),

            _sectionTitle('Third-Party Services'),
            _sectionText(
              'We do not sell or share your personal information with third parties '
                  'except as required to provide our services or comply with legal obligations.',
            ),

            _sectionTitle('Your Consent'),
            _sectionText(
              'By using List Ur Ad, you agree to the terms outlined in this Privacy Policy.',
            ),

            _sectionTitle('Contact Us'),
            _sectionText(
              'If you have any questions about this Privacy Policy, '
                  'please contact us at support@listurad.com.',
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 4.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: AppFonts.bold,
          color: AppColors.clr17324D,
        ),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13.sp,
        fontFamily: AppFonts.medium,
        color: AppColors.clr687684,
        height: 1.5,
      ),
    );
  }
}
