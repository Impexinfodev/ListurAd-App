import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_images.dart';
import 'package:list_ur_add/routes/routes.dart';

class AdvertisementView extends StatefulWidget {
  const AdvertisementView({super.key});

  @override
  State<AdvertisementView> createState() => _AdvertisementViewState();
}

class _AdvertisementViewState extends State<AdvertisementView> {
  int currentIndex = 0;
  int countdown = 5;
  Timer? timer;

  final List<String> images = [AppImages.addImg, AppImages.addImg2];

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    countdown = 5;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        t.cancel();
      }
    });
  }

  void skip() {
    if (currentIndex < images.length - 1) {
      setState(() {
        currentIndex++;
        countdown = 5;
      });
    } else {
      goToHome();
    }
  }

  void goToHome() {
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = countdown / 5;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(images[currentIndex], fit: BoxFit.cover),
          ),

          Positioned(
            top: 40.h,
            right: 30.w,
            child: GestureDetector(
              onTap: skip,
              child: Row(
                children: [
                  Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.medium,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  countdown == 0
                      ? Text(
                    'Ad',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.medium,
                    ),
                  )
                      : Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 1.5.w,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      Text(
                        '$countdown',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
