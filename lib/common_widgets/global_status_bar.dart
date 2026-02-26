import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiHelper {
  static void setStatusBar({required bool isDark, Color? backgroundColor}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor ?? Colors.white,
      statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
      statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
      systemStatusBarContrastEnforced: false,
    ));
  }
}
