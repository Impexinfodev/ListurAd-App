// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';

class CustomTextField extends StatefulWidget {
  String hintText;
  TextEditingController? controller;
  Widget? leading;
  Widget? leading1;
  TextCapitalization? textCapitalization;
  Widget? trailing;
  double? inputLabelWidth;
  double? inputFieldWidth;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  List<String> options; //If user want to show a searchable dropdown
  bool isRequired;
  TextInputType? txKeyboardType;
  bool isEnabled;
  FocusNode? focusNode;
  bool isFocused;
  bool? obscureText;
  bool check;
  bool checking;
  bool changeColor;
  bool? readOnly;
  String? labelText;
  Widget? labelWidget;
  String? labelText1;
  void Function(String)? onChanged;
  Function(String?)? onSaved;
  int maxCheck;
  int? maxLength;
  double? borderRadius;
  Color? borderCl;
  Color? fillColor;
  final void Function(String)? onFieldSubmitted;
  Function()? onEditingComplete;
  Function()? onTap;
  final ValueChanged<String>? onOptionSelection;

  Color? hintColor;
  TextStyle? hintStyle;
  double? borderWidth;
  Color? textColor;

  CustomTextField({
    super.key,
    this.readOnly,
    this.hintText = "",
    this.maxCheck = 1,
    this.maxLength,
    this.leading,
    this.leading1,
    this.trailing,
    this.controller,
    this.labelText,
    this.labelText1,
    this.labelWidget,
    this.options = const [],
    this.inputFormatters,
    this.onTap,
    this.isRequired = false,
    this.onChanged,
    this.checking = false,
    this.inputLabelWidth,
    this.inputFieldWidth,
    this.isEnabled = true,
    this.txKeyboardType,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.check = false,
    this.isFocused = false,
    this.onSaved,
    this.changeColor = false,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onOptionSelection,
    this.textCapitalization,
    this.borderCl,
    this.fillColor,
    this.borderRadius,
    this.hintColor,
    this.hintStyle,
    this.borderWidth,
    this.textColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showdropdown = false;
  String? errorText;
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChange);
    }
  }

  void _onFocusChange() {
    setState(() {
      showdropdown = widget.focusNode!.hasFocus;
    });
  }

  void _validate() {
    if (widget.validator != null) {
      final validationResult = widget.validator!(widget.controller?.text);
      if (validationResult != errorText) {
        setState(() {
          errorText = validationResult;
        });
      }
    }
  }

  void _showInfoOverlay(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 220.w,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: const Offset(-220, -30),
          showWhenUnlinked: false,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 200.w,
              height: 25.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppIcons.hoverTxtBg), fit: BoxFit.cover),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5, right: 2, left: 2),
                  child: Text(
                    "Consider only from your current location",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.regular,
                      color: AppColors.clr687684,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void _hideInfoOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.medium,
              color: AppColors.clr141619,
            ),
          ),
        if (widget.labelText != null) const SizedBox(height: 10),
        if (widget.labelWidget != null) widget.labelWidget!,
        if (widget.labelWidget != null) const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: widget.fillColor ?? Colors.white,
            border: widget.borderCl == null
                ? null
                : Border.all(color: widget.borderCl!, width: widget.borderWidth ?? 2.w),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
              controller: widget.controller,
              focusNode: widget.focusNode,
              autofocus: widget.isFocused,
              onFieldSubmitted: widget.onFieldSubmitted,
              onEditingComplete: widget.onEditingComplete,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              keyboardType: widget.txKeyboardType ?? TextInputType.name,
              obscureText: widget.obscureText ?? false,
              enabled: widget.isEnabled,
              maxLines: widget.maxCheck,
              maxLength: widget.maxLength,
              onTap: widget.onTap,

              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: AppFonts.regular,
                color: widget.textColor ?? AppColors.clr687684.withOpacity(0.80),
                fontWeight: FontWeight.w400,
              ),

              decoration: InputDecoration(
                counterText: "",
                fillColor: widget.fillColor ?? Colors.white,
                filled: true,
                errorStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.regular,
                  color: Colors.red,
                ),
                labelText: widget.labelText1,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  fontFamily: AppFonts.regular,
                  color: const Color(0xFF3A3838),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 6.5.h, horizontal: 14.w),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle:
                    widget.hintStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                      fontFamily: AppFonts.regular,
                      color: widget.hintColor ?? AppColors.clr687684.withOpacity(0.80),
                      fontWeight: FontWeight.w500,
                    ),
                isDense: true,
                suffixIcon: widget.leading1 == null
                    ? null
                    : CompositedTransformTarget(
                        link: layerLink,
                        child: GestureDetector(
                          onTap: () {
                            if (overlayEntry == null) {
                              _showInfoOverlay(context);
                            } else {
                              _hideInfoOverlay();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: widget.leading1!,
                          ),
                        ),
                      ),
                suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                prefixIcon: widget.leading == null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: widget.leading,
                      ),
                prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              ),
              validator: widget.validator,
              inputFormatters: widget.inputFormatters,
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 4.w),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 10.sp, fontFamily: AppFonts.regular),
            ),
          ),
        if (widget.focusNode != null && widget.options.isNotEmpty && showdropdown)
          const SizedBox(height: 8),
        if (widget.focusNode != null && widget.options.isNotEmpty && showdropdown)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0.5, color: Colors.white),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(115, 115, 115, 0.33),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                ...widget.options.map(
                  (e) => InkWell(
                    onTap: () {
                      if (widget.controller != null) {
                        widget.controller!.text = e;
                        if (widget.onOptionSelection != null) {
                          widget.onOptionSelection!(e);
                        }
                      }
                      widget.focusNode!.unfocus();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: Row(children: [Text(e)]),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class CustomDateField extends StatefulWidget {
  String hintText;
  TextEditingController? controller;
  double? inputLabelWidth;
  double? inputFieldWidth;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  List<String> options; //If user want to show a searchable dropdown
  bool isRequired;
  TextInputType? txKeyboardType;
  bool isEnabled;
  FocusNode? focusNode;
  bool isFocused;
  bool? obscureText;
  bool check;
  bool checking;
  bool changeColor;
  String labelText;
  void Function(String)? onChanged;
  Function(String?)? onSaved;
  int maxCheck;
  final void Function(String)? onFieldSubmitted;
  Function()? onEditingComplete;
  Function()? onTap;

  CustomDateField({
    super.key,
    this.hintText = "",
    this.maxCheck = 1,
    this.controller,
    this.labelText = "",
    this.options = const [],
    this.inputFormatters,
    this.onTap,
    this.isRequired = false,
    this.onChanged,
    this.checking = false,
    this.inputLabelWidth,
    this.inputFieldWidth,
    this.isEnabled = true,
    this.txKeyboardType,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.check = false,
    this.isFocused = false,
    this.onSaved,
    this.changeColor = false,
    this.onFieldSubmitted,
    this.onEditingComplete,
  });

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        InkWell(
          onTap: widget.onTap,
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            autofocus: widget.isFocused,
            onFieldSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            keyboardType: widget.txKeyboardType ?? TextInputType.name,
            obscureText: widget.obscureText ?? false,
            enabled: widget.isEnabled,
            maxLines: widget.maxCheck,
            style: const TextStyle(color: AppColors.mainColor, fontSize: 16),
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
              suffixIcon: const Icon(Icons.calendar_month, color: AppColors.mainColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.mainColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.mainColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.mainColor),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 16, color: AppColors.mainColor.withOpacity(0.25)),
            ),
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
          ),
        ),
      ],
    );
  }
}
