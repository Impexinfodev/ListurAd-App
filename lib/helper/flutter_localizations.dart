import 'dart:convert';
import 'package:flutter/services.dart';

class LocalizationService {
  static Map<String, String> _localizedStrings = {};

  static Future<void> load(String languageCode) async {
    final jsonString =
    await rootBundle.loadString('assets/lang/$languageCode.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  static String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}
