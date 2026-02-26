import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_button.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class MultiSelectLocationDropdown extends StatefulWidget {
  const MultiSelectLocationDropdown({super.key});

  @override
  State<MultiSelectLocationDropdown> createState() => _MultiSelectLocationDropdownState();
}

class _MultiSelectLocationDropdownState extends State<MultiSelectLocationDropdown> {
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
    provider.loadTempFromSelected();
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
                offset: Offset(0, 50.h),
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
                          offset: const Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Consumer<AuthProvider>(
                      builder: (context, provider, _) {
                        final tempSelectedLocations = provider.tempSelectedLocations;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextField(
                              leading: Image.asset(
                                AppIcons.searchIc,
                                width: 27.w,
                                height: 27.h,
                                fit: BoxFit.contain,
                              ),
                              controller: searchController,
                              hintText: 'Search locations...',
                              leading1: Image.asset(
                                AppIcons.locationOnIc,
                                width: 20.w,
                                height: 20.h,
                                fit: BoxFit.contain,
                              ),
                              onChanged: provider.searchLocations,
                            ),
                            SizedBox(height: 8.h),
                            tempSelectedLocations.isNotEmpty
                                ? Container(
                                    height: 40.h,
                                    margin: EdgeInsets.only(bottom: 8.h),
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: tempSelectedLocations.map((loc) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 6.w),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 6.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8.r),
                                            border: Border.all(
                                              color: AppColors.clrEFEFEF,
                                              width: 1.w,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.10),
                                                blurRadius: 2,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                loc.city.split(',')[0],
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.clr6D6D6D,
                                                  fontFamily: AppFonts.regular,
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              GestureDetector(
                                                onTap: () {
                                                  provider.removeTempLocation(loc);
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  size: 16.sp,
                                                  color: AppColors.clr6D6D6D,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : SizedBox(),
                            tempSelectedLocations.isNotEmpty
                                ? Container(
                                    height: 40.h,
                                    margin: EdgeInsets.only(bottom: 8.h),
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: tempSelectedLocations.map((loc) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 6.w),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 6.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8.r),
                                            border: Border.all(
                                              color: AppColors.clrEFEFEF,
                                              width: 1.w,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.10),
                                                blurRadius: 2,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                loc.city.split(',')[0],
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.clr6D6D6D,
                                                  fontFamily: AppFonts.regular,
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              GestureDetector(
                                                onTap: () {
                                                  provider.removeTempLocation(loc);
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  size: 16.sp,
                                                  color: AppColors.clr6D6D6D,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : SizedBox(),
                            provider.isLoading
                                ? const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    height: 150.h,
                                    child: provider.locations.isEmpty
                                        ? const Center(child: Text('No locations found'))
                                        : ListView.builder(
                                            itemCount: provider.locations.length,
                                            itemBuilder: (context, index) {
                                              final loc = provider.locations[index];
                                              return GestureDetector(
                                                onTap: () => provider.toggleTempLocation(loc),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12.w,
                                                    vertical: 10.h,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    bottom: 10.h,
                                                    left: 2.w,
                                                    right: 2.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(16.r),
                                                    border: Border.all(
                                                      color: AppColors.clrF7F7F7,
                                                      width: 2.w,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.10),
                                                        blurRadius: 6,
                                                        offset: Offset(0, 1),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        AppIcons.locationOnIc,
                                                        width: 20.w,
                                                        height: 20.h,
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      Expanded(
                                                        child: Text(
                                                          loc.city,
                                                          style: TextStyle(
                                                            fontFamily: AppFonts.regular,
                                                            fontSize: 16.sp,
                                                            color: AppColors.clr2388FF.withOpacity(
                                                              0.70,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.add,
                                                        color: AppColors.clr687684,
                                                        size: 18.sp,
                                                      ),
                                                      SizedBox(width: 8.w),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              buttonName: 'Save Ads Area',
                              onPressed: () {
                                provider.applySelection();
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
                borderRadius: BorderRadius.circular(12.r),
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
                  Image.asset(AppIcons.locationIc, width: 22.w, height: 22.h),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: provider.selectedLocations.isEmpty
                        ? Text(
                            'Locations',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.clr687684.withOpacity(0.80),
                              fontFamily: AppFonts.regular,
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: provider.selectedLocations.map((loc) {
                                return Container(
                                  margin: EdgeInsets.only(right: 6.w),
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.clrEFEFEF,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        loc.city,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.clr929292,
                                          fontFamily: AppFonts.regular,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      GestureDetector(
                                        onTap: () {
                                          provider.removeLocation(loc);
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
