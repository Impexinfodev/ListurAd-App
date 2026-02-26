import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_ur_add/helper/language_storage.dart';
import 'package:list_ur_add/modules/auth/model/language_model.dart';
import 'package:list_ur_add/service/api_logs.dart';
import 'package:list_ur_add/service/api_service.dart';

class LanguageProvider with ChangeNotifier {
  List<LanguageModel> languages = [];
  LanguageModel? selectedLanguage;

  bool isLoadingLanguages = false;

  Future<void> loadLanguages() async {
    isLoadingLanguages = true;
    notifyListeners();
    try {
      final response = await ApiService.languages();
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true) {
        List<dynamic> list = data["data"];
        languages =
            list
                .map((e) => LanguageModel.fromJson(e))
                .where((lang) => lang.isActive == true)
                .toList()
              ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
      } else {
        languages = [];
      }
    } catch (e) {
      languages = [];
      Log.console("Error: $e");
    }
    isLoadingLanguages = false;
    notifyListeners();
  }

  void setSelectedLanguage(LanguageModel lang) {
    selectedLanguage = lang;
    notifyListeners();
    LanguageStorage.saveLanguage(lang.code);
  }
}
