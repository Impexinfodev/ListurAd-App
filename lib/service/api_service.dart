// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:list_ur_add/service/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';
import 'api_logs.dart';

class ApiService {
  static Future<String> getAccessToken() async {
    try {
      var instance = await SharedPreferences.getInstance();
      var token = instance.getString('access_token');
      Log.console("AccessToken$token");
      if (token == null) {
        return "";
      } else {
        return token;
      }
    } catch (e) {
      Log.console("Error(Function getAccessToken): $e");
      return '';
    }
  }

  ///registerApi
  static Future<http.Response> register({required Map<String, dynamic> body}) async {
    return await http.post(
      Uri.parse(ApiUrl.register),
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: jsonEncode(body),
    );
  }

  ///loginApi
  static Future<http.Response> login({
    required String phone,
    required String countryCode,
    required String purpose,
  }) async {
    return await http.post(
      Uri.parse(ApiUrl.sendOtp),
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: jsonEncode({"phone": phone, "country_code": countryCode, "purpose": purpose}),
    );
  }

  /// otpVerifyApi
  static Future<http.Response> otpVerification({
    required String phone,
    required String countryCode,
    required String otp,
    required String purpose,
  }) async {
    return await http.post(
      Uri.parse(ApiUrl.verifyOtp),
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: jsonEncode({
        "phone": phone,
        "country_code": countryCode,
        "otp": otp,
        "purpose": purpose,
      }),
    );
  }

  ///loginApi
  static Future<http.Response> checkPhone({
    required String phone,
    required String countryCode,
  }) async {
    return await http.post(
      Uri.parse(ApiUrl.checkPhone),
      headers: {"Content-Type": "application/json", "Accept": "application/json0"},
      body: jsonEncode({"phone": phone, "country_code": countryCode}),
    );
  }

  ///languages
  static Future<http.Response> languages() async {
    return await http.get(
      Uri.parse(ApiUrl.languages),
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
    );
  }

  ///locations
  static Future<http.Response> locations() async {
    return await http.get(
      Uri.parse(ApiUrl.locations),
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
    );
  }
}
