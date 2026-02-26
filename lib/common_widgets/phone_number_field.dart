// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/modules/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class PhoneNumberField extends StatefulWidget {
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
  List<String> options;
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
  bool isPhoneNumber;

  PhoneNumberField({
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
    this.isPhoneNumber = false,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  bool showDropdown = false;
  String? errorText;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_onFocusChange);
    }
    if (widget.controller != null) {
      widget.controller!.addListener(_onTextChanged);
    }
  }

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChange);
    }
    if (widget.controller != null) {
      widget.controller!.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      showDropdown = widget.focusNode!.hasFocus;
    });
  }

  void _onTextChanged() {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    if (widget.controller != null) {
      provider.setPhoneNumber(widget.controller!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.labelText != null)
              Text(
                widget.labelText!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTxtClr,
                ),
              ),
            if (widget.labelText != null) const SizedBox(height: 4),
            if (widget.labelWidget != null) widget.labelWidget!,
            if (widget.labelWidget != null) const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.clrF7F7F7, width: 2.w),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextFormField(
                readOnly: widget.readOnly ?? false,
                textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
                controller: widget.controller,
                focusNode: widget.focusNode,
                autofocus: widget.isFocused,
                onFieldSubmitted: widget.onFieldSubmitted,
                onEditingComplete: widget.onEditingComplete,
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                  provider.setPhoneNumber(value);
                },
                onSaved: widget.onSaved,
                keyboardType: widget.isPhoneNumber
                    ? TextInputType.phone
                    : widget.txKeyboardType ?? TextInputType.name,
                obscureText: widget.obscureText ?? false,
                enabled: widget.isEnabled,
                maxLines: widget.maxCheck,
                maxLength: widget.maxLength,
                onTap: widget.onTap,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: AppFonts.regular,
                  color: AppColors.clr687684.withOpacity(0.80),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  counterText: "",
                  fillColor: widget.fillColor ?? Colors.white,
                  filled: true,
                  errorStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: Colors.red,
                    fontFamily: AppFonts.regular,
                  ),
                  labelText: widget.labelText1,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.regular,
                    color: AppColors.clr687684,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
                    borderSide: BorderSide(color: widget.borderCl ?? Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
                    borderSide: BorderSide(color: widget.borderCl ?? Colors.white),
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: AppFonts.regular,
                    color: AppColors.clr687684.withOpacity(0.80),
                    fontWeight: FontWeight.w500,
                  ),
                  isDense: true,
                  prefixIcon: widget.isPhoneNumber
                      ? Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 6.w, bottom: 2.h),
                          child: Text(
                            provider.countryCode,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppFonts.medium,
                              fontWeight: FontWeight.w500,
                              color: AppColors.clr2388FF,
                            ),
                          ),
                        )
                      : widget.leading,
                  prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                  suffixIcon: provider.isCheckingPhone
                      ? Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : null,
                  suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                ),
                validator: widget.validator,
                inputFormatters: widget.inputFormatters,
              ),
            ),

            if (errorText != null)
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 4.w),
                child: Text(
                  errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 10.sp),
                ),
              ),

            if (widget.focusNode != null && widget.options.isNotEmpty && showDropdown)
              const SizedBox(height: 8),
            if (widget.focusNode != null && widget.options.isNotEmpty && showDropdown)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.5, color: Colors.white),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(115, 115, 115, 0.33),
                      blurRadius: 18,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: widget.options
                      .map(
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
                            child: Row(
                              children: [
                                Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: AppFonts.regular,
                                    color: AppColors.clr687684.withOpacity(0.80),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        );
      },
    );
  }
}
