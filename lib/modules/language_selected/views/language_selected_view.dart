import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/custom_language_select_dropdown.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/auth/model/language_model.dart';
import 'package:list_ur_add/modules/language_selected/provider/language_provider.dart';
import 'package:list_ur_add/routes/routes.dart';
import 'package:provider/provider.dart';

class LanguageSelectedView extends StatefulWidget {
  const LanguageSelectedView({super.key});

  @override
  State<LanguageSelectedView> createState() => _LanguageSelectedViewState();
}

class _LanguageSelectedViewState extends State<LanguageSelectedView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LanguageProvider>(context, listen: false);
      provider.loadLanguages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(AppIcons.logoIc, fit: BoxFit.contain, height: 70.h, width: 258.w),
                  SizedBox(height: 80.h),
                  CustomLanguageSelectDropdown<LanguageModel>(
                    hintText: 'Default Language',
                    items: languageProvider.languages,
                    selectedValue: languageProvider.selectedLanguage,
                    itemLabel: (lang) => lang.name,
                    onChanged: (lang) {
                      if (lang != null) {
                        languageProvider.setSelectedLanguage(lang);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
            child: CustomButton(
              buttonName: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ),
        );
      },
    );
  }
}
