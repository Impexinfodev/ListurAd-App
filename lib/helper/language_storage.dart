import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorage {
  static const _singleKey = 'selected_language';

  static Future<void> saveLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_singleKey, code);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_singleKey);
  }

  static const _multiKey = 'selected_languages';

  static Future<void> saveLanguages(List<String> codes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_multiKey, codes);
  }

  static Future<List<String>> getLanguages() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_multiKey) ?? [];
  }
}
