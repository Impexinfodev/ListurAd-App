import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'dart:async';

import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/auth/provider/auth_provider.dart';
import 'package:list_ur_add/modules/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {

  static const List<Map<String, dynamic>> greetings = [
    {
      'parts': ['List', 'Ur', 'Ad'],
      'subtitle': 'Your Ad, Your Audience',
    },
    {
      'parts': ['लिस्ट', 'यूआर', 'एड'],
      'subtitle': 'आपका विज्ञापन, आपका दर्शक',
    },
    {
      'parts': ['ਲਿਸਟ', 'ਯੂਰ', 'ਐਡ'],
      'subtitle': 'ਤੁਹਾਡਾ ਵਿਗਿਆਪਨ, ਤੁਹਾਡਾ ਦਰਸ਼ਕ',
    },
    {
      'parts': ['লিস্ট', 'ইউর', 'অ্যাড'],
      'subtitle': 'আপনার বিজ্ঞাপন, আপনার দর্শক',
    },
    {
      'parts': ['列斯特', '优', '艾德'],
      'subtitle': '您的广告，您的受众',
    },
    {
      'parts': ['لیست', 'یور', 'اد'],
      'subtitle': 'تبلیغ شما، مخاطبان شما',
    },
  ];

  int _index = 0;

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _navigated = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<AuthProvider>(context, listen: false)
          .initCountry();
    });
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    // _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.forward();

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _controller.forward(from: 0);

      final nextIndex = (_index + 1) % greetings.length;

      setState(() {
        _index = nextIndex;
      });
      if (nextIndex == 0 && !_navigated) {
        _navigated = true;
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            context.read<SplashProvider>().checkAuth(context);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = 140;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ClipRect(
          child: SizedBox(
            height: height,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final double t = _animation.value;

                final double bubble = t > 0.75 ? (1 - t) * 14 : 0;

                final currentOffset = (-height * t) + bubble;
                final nextOffset = (height * (1 - t)) + bubble;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(0, currentOffset),
                      child: _textBlock(
                        greetings[_index]['parts']!,
                        greetings[_index]['subtitle']!,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, nextOffset),
                      child: _textBlock(
                        greetings[(_index + 1) % greetings.length]['parts']!,
                        greetings[(_index + 1) % greetings.length]['subtitle']!,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _textBlock(List<String> parts, String subtitle) {
    return Column(
      crossAxisAlignment: .center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: .center,
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [
            Image.asset(AppIcons.listUrAdIc, width: 55, height: 55, fit: BoxFit.cover),
            SizedBox(width: 6.w),
            brandText(parts),
          ],
        ),
        SizedBox(height: 0.h),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 20.sp,
            height: 1.1,
            color: AppColors.clr17324D,
            fontFamily: AppFonts.medium,
          ),
        ),
      ],
    );
  }

  Widget brandText(List<String> parts) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: parts[0],
            style: TextStyle(
              fontSize: 45.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.bold,
              color: AppColors.clr17324D,
            ),
          ),
          TextSpan(
            text: parts[1],
            style: TextStyle(
              fontSize: 45.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.bold,
              color: AppColors.clr0075F9,
            ),
          ),
          TextSpan(
            text: parts[2],
            style: TextStyle(
              fontSize: 45.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.bold,
              color: AppColors.clr17324D,
            ),
          ),
        ],
      ),
    );
  }
}
