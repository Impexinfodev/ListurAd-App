import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class MultiSelectDropdown extends StatefulWidget {
  const MultiSelectDropdown({super.key});

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  final TextEditingController searchController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  double horizontalPadding = 16.w;

  @override
  void dispose() {
    searchController.dispose();
    _removeDropdown();
    super.dispose();
  }

  void _toggleDropdown() {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    provider.loadLocations();
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _removeDropdown();
    }
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final provider = Provider.of<AuthProvider>(context, listen: false);

    return OverlayEntry(
      builder: (context) => Positioned.fill(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _removeDropdown,
          child: Stack(
            children: [
              CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, 42.h),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 2 * horizontalPadding,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Consumer<AuthProvider>(
                      builder: (context, provider, _) {
                        final tempSelectedLanguages = provider.tempSelectedLanguages;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (tempSelectedLanguages.isNotEmpty) ...[
                              SizedBox(
                                child: Wrap(
                                  spacing: 6.w,
                                  runSpacing: 6.h,
                                  children: tempSelectedLanguages.map((lang) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.clrEFEFEF,
                                        border: Border.all(color: AppColors.clrF7F7F7),
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            lang.name,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.clr929292,
                                              fontFamily: AppFonts.regular,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          GestureDetector(
                                            onTap: () {
                                              provider.removeLanguage(lang);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              size: 16.sp,
                                              color: AppColors.clr929292,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                            provider.isLoadingLanguages
                                ? const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    height: 150.h,
                                    child: provider.languages.isEmpty
                                        ? const Center(child: Text('No languages found'))
                                        : MediaQuery.removePadding(
                                            removeTop: true,
                                            context: context,
                                            child: ListView.builder(
                                              itemCount: provider.languages.length,
                                              itemBuilder: (context, index) {
                                                final lang = provider.languages[index];
                                                return GestureDetector(
                                                  onTap: () => provider.toggleTempLanguage(lang),
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w,
                                                      vertical: 10.h,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: AppColors.clrF7F7F7,
                                                          width: 1.w,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          AppIcons.translateUnselectedIc,
                                                          width: 22.w,
                                                          height: 22.h,
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        Text(
                                                          lang.name,
                                                          style: TextStyle(
                                                            fontFamily: AppFonts.regular,
                                                            fontSize: 16.sp,
                                                            color: AppColors.clr687684.withOpacity(
                                                              0.80,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                  ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              buttonName: 'Select',
                              onPressed: () {
                                provider.applyLanguageSelection();
                                _removeDropdown();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
        return CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _toggleDropdown,
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(AppIcons.translateUnselectedIc, width: 22.w, height: 22.h),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: provider.selectedLanguages.isEmpty
                        ? TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Set Readable Languages',
                              border: InputBorder.none,
                              isDense: true,
                              hintStyle: TextStyle(
                                color: AppColors.clr687684.withOpacity(0.80),
                                fontFamily: AppFonts.regular,
                                fontSize: 16.sp,
                              ),
                            ),
                            onTap: _toggleDropdown,
                            onChanged: provider.searchLanguages,
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: provider.selectedLanguages.map((lang) {
                                return Container(
                                  margin: EdgeInsets.only(right: 6.w),
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.clrEFEFEF,
                                    border: Border.all(color: AppColors.clrF7F7F7),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        lang.name,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.clr929292,
                                          fontFamily: AppFonts.regular,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      GestureDetector(
                                        onTap: () {
                                          provider.removeLanguage(lang);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 16.sp,
                                          color: AppColors.clr929292,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
