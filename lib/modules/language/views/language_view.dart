import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/modules/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AuthProvider>().loadLanguages();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Choose Language'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            Consumer<AuthProvider>(
              builder: (context, auth, _) {
                if (auth.selectedLanguages.isNotEmpty &&
                    _searchController.text != auth.selectedLanguages.first.name) {
                  _searchController.text = auth.selectedLanguages.first.name;
                  _searchController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _searchController.text.length),
                  );
                }

                return CustomTextField(
                  controller: _searchController,
                  hintText: 'Search language',
                  textColor: AppColors.clr141619,
                  leading: Icon(Icons.arrow_back_ios_new, color: AppColors.clr141619),
                  leading1: Icon(Icons.close, color: AppColors.clr141619),
                  borderWidth: 2.w,
                  borderCl: AppColors.clrF7F7F7,
                  onChanged: (value) {
                    auth.searchLanguages(value);
                  },
                );
              },
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Consumer<AuthProvider>(
                builder: (context, auth, _) {
                  if (auth.isLoadingLanguages) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: auth.languages.length,
                    itemBuilder: (context, index) {
                      final lang = auth.languages[index];
                      final isSelected = auth.selectedLanguages.any((l) => l.code == lang.code);

                      return ListTile(
                        title: Text(
                          lang.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.clr19213D,
                            fontFamily: AppFonts.regular,
                          ),
                        ),
                        trailing: isSelected ? Icon(Icons.check, color: AppColors.clr2388FF) : null,
                        onTap: () {
                          auth.selectSingleLanguage(lang);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
