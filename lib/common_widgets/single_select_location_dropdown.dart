import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SingleSelectLocationDropdown extends StatefulWidget {
  final String label;
  final bool isRequired;

  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Widget? widget;
  final Widget? labelWidget;

  const SingleSelectLocationDropdown({
    super.key,
    required this.label,
    this.isRequired = false,

    this.labelTextStyle,
    this.hintText,
    this.hintTextStyle,
    this.widget,
    this.labelWidget,
  });

  @override
  State<SingleSelectLocationDropdown> createState() => _SingleSelectLocationDropdownState();
}

class _SingleSelectLocationDropdownState extends State<SingleSelectLocationDropdown> {
  final TextEditingController searchController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    searchController.dispose();
    _removeDropdown();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
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
                offset: Offset(0, 50.h),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32.w,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(
                          controller: searchController,
                          hintText: 'Search location...',
                          leading: Image.asset(AppIcons.searchIc, width: 24.w),
                          onChanged: provider.searchLocations,
                        ),
                        SizedBox(height: 10.h),

                        Consumer<AuthProvider>(
                          builder: (context, provider, _) {
                            if (provider.isLoading) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (provider.locations.isEmpty) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text('No locations found'),
                              );
                            }

                            return SizedBox(
                              height: 180.h,
                              child: ListView.builder(
                                itemCount: provider.locations.length,
                                itemBuilder: (context, index) {
                                  final loc = provider.locations[index];
                                  final isSelected = provider.selectedLocation?.id == loc.id;

                                  return GestureDetector(
                                    onTap: () {
                                      provider.selectLocation(loc);
                                      _removeDropdown();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 8.h),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.clr2388FF.withOpacity(0.08)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12.r),
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.clr2388FF
                                              : AppColors.clrF7F7F7,
                                          width: 2.w,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(AppIcons.locationOnIc, width: 20.w),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: Text(
                                              loc.city,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: AppFonts.regular,
                                                color: AppColors.clr2388FF,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.labelWidget != null) ...[widget.labelWidget!, SizedBox(width: 6.w)],
                RichText(
                  text: TextSpan(
                    text: widget.label,
                    style:
                        widget.labelTextStyle ??
                        TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.medium,
                          color: AppColors.clr141619,
                        ),
                    children: widget.isRequired
                        ? [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Colors.red, fontSize: 14.sp),
                            ),
                          ]
                        : [],
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            CompositedTransformTarget(
              link: _layerLink,
              child: GestureDetector(
                onTap: _toggleDropdown,
                child: Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: provider.selectedLocation == null
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.hintText ?? 'Select ${widget.label}',
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          widget.hintTextStyle ??
                                          TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppFonts.regular,
                                            color: AppColors.clr687684.withOpacity(0.80),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),

                                  if (widget.widget != null) ...[
                                    SizedBox(width: 6.w),
                                    widget.widget!,
                                  ],
                                ],
                              )
                            : Text(
                                provider.selectedLocation!.city,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.clr929292,
                                  fontFamily: AppFonts.regular,
                                ),
                              ),
                      ),

                      if (provider.selectedLocation != null)
                        GestureDetector(
                          onTap: provider.clearLocation,
                          child: Icon(Icons.close, size: 18.sp, color: AppColors.clr929292),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
