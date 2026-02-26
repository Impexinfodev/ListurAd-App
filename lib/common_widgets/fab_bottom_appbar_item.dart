import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/modules/dashboard/provider/dashboard_provider.dart';
import 'package:list_ur_add/widgets/ad_widget/ad_terms_sheet.dart';
import 'package:provider/provider.dart';

class FABBottomAppBarItem {
  final String image;
  final String text;

  FABBottomAppBarItem({required this.image, required this.text});
}

class FABBottomAppBar extends StatelessWidget {
  final List<FABBottomAppBarItem> items;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;

  const FABBottomAppBar({
    super.key,
    required this.items,
    this.height = 50.0,
    this.iconSize = 20.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        return BottomAppBar(
          surfaceTintColor: backgroundColor,
          color: Colors.white,
          shadowColor: Colors.white,
          padding: const EdgeInsets.all(0),
          shape: notchedShape,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(items.length + 1, (index) {
              if (index == items.length ~/ 2) {
                return Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 43,
                      width: 43,
                      child: Transform.translate(
                        offset: const Offset(0, -8),
                        child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: AppColors.clr2388FF,
                          onPressed: () {
                            AdTermsSheet.show(context);
                          },
                          child: const Icon(Icons.add, color: Colors.white, size: 42),
                        ),
                      ),
                    ),
                  ),
                );
              }
              final itemIndex = index > items.length ~/ 2 ? index - 1 : index;
              return _buildTabItem(
                provider: provider,
                item: items[itemIndex],
                index: itemIndex,
                isSelected: provider.selectedIndex == itemIndex,
              );
            }),
          ),
        );
      },
    );
    ();
  }

  Widget _buildTabItem({
    required DashboardProvider provider,
    required FABBottomAppBarItem item,
    required int index,
    required bool isSelected,
  }) {
    Color? color = isSelected ? selectedColor : this.color;

    return Expanded(
      child: SizedBox(
        height: height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              provider.onItemTapped(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(item.image, height: iconSize.h, width: iconSize.w, color: color),
                SizedBox(height: 4.h),
                Text(
                  item.text,
                  style: TextStyle(
                    color: isSelected ? AppColors.clr2388FF : AppColors.clr687684,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
