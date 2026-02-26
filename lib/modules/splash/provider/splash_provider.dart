import 'package:flutter/material.dart';
import 'package:list_ur_add/modules/dashboard/views/dashboard_view.dart';
import 'package:list_ur_add/modules/language_selected/views/language_selected_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier{

  Future<void> checkAuth(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    await Future.delayed(const Duration(seconds: 2));
    if (token != null && token != '') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashboardView(index: 0)),
        (_) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LanguageSelectedView()), (_) => false);
    }
  }
}