import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_icons.dart';

class RichMessageBox extends StatefulWidget {
  final TextEditingController controller;

  const RichMessageBox({super.key, required this.controller});

  @override
  State<RichMessageBox> createState() => _RichMessageBoxState();
}

class _RichMessageBoxState extends State<RichMessageBox> {
  bool isBold = false;
  bool isUnderline = false;
  bool isEditing = true;

  TextAlign textAlign = TextAlign.left;
  double fontSize = 14;
  double lineSpacing = 1.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.clr2388FF.withOpacity(0.10), blurRadius: 6)],
        color: AppColors.clrFEFEFE,
        border: Border.all(color: AppColors.clrD9D9D9.withOpacity(0.60), width: 1.w),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.clrD9D9D9.withOpacity(0.40), width: 1.w),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      maxLines: 6,
                      enabled: isEditing,
                      textAlign: textAlign,
                      style: TextStyle(
                        fontSize: fontSize.sp,
                        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                        decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
                        height: lineSpacing,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Your Message Here....',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.clr6D758F.withOpacity(0.80),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() => isEditing = !isEditing);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: [
                          BoxShadow(color: AppColors.clr6D758F.withOpacity(0.20), blurRadius: 10),
                        ],
                      ),
                      child: Image.asset(
                        AppIcons.editIc,
                        height: 12.h,
                        width: 12.w,
                        color: isEditing ? AppColors.clr2388FF : AppColors.clr6D758F,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.clrD9D9D9.withOpacity(0.50)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _icon(
                    Icons.format_bold,
                    isActive: isBold,
                    onTap: () {
                      setState(() => isBold = !isBold);
                    },
                  ),

                  _icon(
                    Icons.format_underline,
                    isActive: isUnderline,
                    onTap: () {
                      setState(() => isUnderline = !isUnderline);
                    },
                  ),

                  _icon(
                    Icons.text_fields,
                    isActive: fontSize > 14,
                    onTap: () {
                      setState(() {
                        fontSize = fontSize == 14 ? 18 : 14;
                      });
                    },
                  ),

                  _icon(Icons.link, onTap: _insertLink),

                  _icon(Icons.format_list_bulleted, onTap: _addBullet),

                  _icon(Icons.format_list_numbered_sharp, onTap: _addNumber),

                  _icon(
                    Icons.format_align_left,
                    isActive: textAlign == TextAlign.left,
                    onTap: () {
                      setState(() {
                        textAlign = textAlign == TextAlign.left ? TextAlign.left : TextAlign.left;
                      });
                    },
                  ),

                  _icon(
                    Icons.format_align_right,
                    isActive: textAlign == TextAlign.right,
                    onTap: () {
                      setState(() {
                        textAlign = textAlign == TextAlign.right ? TextAlign.left : TextAlign.right;
                      });
                    },
                  ),

                  _icon(
                    Icons.format_align_justify_outlined,
                    isActive: textAlign == TextAlign.justify,
                    onTap: () {
                      setState(() {
                        textAlign = textAlign == TextAlign.justify
                            ? TextAlign.left
                            : TextAlign.justify;
                      });
                    },
                  ),

                  _icon(
                    Icons.format_line_spacing_outlined,
                    isActive: lineSpacing > 1.4,
                    onTap: () {
                      setState(() {
                        lineSpacing = lineSpacing == 1.4 ? 2.0 : 1.4;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _icon(IconData icon, {required VoidCallback onTap, bool isActive = false}) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, size: 22.sp, color: isActive ? AppColors.clr2388FF : AppColors.clr687684),
    );
  }

  void _insertLink() {
    widget.controller.text += ' https://example.com';
    _moveCursor();
  }

  void _addBullet() {
    widget.controller.text += '\n• ';
    _moveCursor();
  }

  void _addNumber() {
    final lines = widget.controller.text.split('\n').length;
    widget.controller.text += '\n$lines. ';
    _moveCursor();
  }

  void _moveCursor() {
    widget.controller.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.controller.text.length),
    );
  }
}
