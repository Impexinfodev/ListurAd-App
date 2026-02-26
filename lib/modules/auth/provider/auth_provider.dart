import 'dart:async';
import 'dart:convert';

import 'package:country_codes/country_codes.dart' as CountryCodes;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:list_ur_add/helper/language_storage.dart';
import 'package:list_ur_add/modules/auth/model/language_model.dart';
import 'package:list_ur_add/modules/auth/model/location_model.dart';
import 'package:list_ur_add/modules/auth/model/registration_data.dart';
import 'package:list_ur_add/modules/auth/views/otp_view.dart';
import 'package:list_ur_add/routes/routes.dart';
import 'package:list_ur_add/service/api_logs.dart';
import 'package:list_ur_add/service/api_service.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class AuthProvider with ChangeNotifier {
  List<LanguageModel> languages = [];
  List<LanguageModel> selectedLanguages = [];
  List<LanguageModel> tempSelectedLanguages = [];

  List<LocationModel> locations = [];
  List<LocationModel> selectedLocations = [];
  List<LocationModel> tempSelectedLocations = [];

  LocationModel? selectedLocation;

  String phoneNumber = '';
  String countryCode = '+91';
  String? tempToken;

  bool isVerified = false;
  bool isLoadingLanguages = false;
  bool isLoading = false;

  bool isCheckingPhone = false;
  bool phoneExists = false;
  bool? onboardingCompleted;
  Timer? debounce;

  final TextEditingController otpController = TextEditingController();

  RegistrationData registrationData = RegistrationData();

  void setPhone(String phone, String countryCode) {
    registrationData.phone = phone;
    registrationData.countryCode = countryCode;
    notifyListeners();
  }

  void setPrivacyAccepted(bool value) {
    registrationData.isPrivacyAccepted = value;
    notifyListeners();
  }

  void setLanguages(List<String> languages) {
    registrationData.selectedLanguages = languages;
    notifyListeners();
  }

  void setLocations(List<String> locations) {
    registrationData.selectedLocations = locations;
    notifyListeners();
  }

  Future<void> initCountry() async {
    await CountryCodes.CountryCodes.init();

    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        countryCode = "+91";
        notifyListeners();
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String? isoCode = placemarks.first.isoCountryCode;

      if (isoCode != null) {
        final details = CountryCodes.CountryCodes.detailsForLocale(Locale('', isoCode));

        if (details != null) {
          countryCode = "+${details.dialCode}";
        } else {
          countryCode = "+91";
        }
      } else {
        countryCode = "+91";
      }
    } catch (e) {
      countryCode = "+91";
    }

    notifyListeners();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  bool validatePhoneNumber() {
    try {
      final parsed = PhoneNumber.parse(phoneNumber, callerCountry: IsoCode.IN);
      return parsed.isValid();
    } catch (e) {
      return false;
    }
  }

  Future<void> registerUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final body = registrationData.toJson();
      body["verification_token"] = tempToken;

      Log.console("Register API Body: $body");

      final response = await ApiService.register(body: body);

      Log.console("Register API Response: ${response.body}");

      final data = jsonDecode(response.body);

      if (data["success"] == true) {
        Log.console("Register Success! Navigating to Home");
        Navigator.pushNamed(context, AppRoutes.home);
      } else {
        Log.console("Register Failed: ${data["message"]}");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data["message"] ?? "Registration failed")));
      }
    } catch (e) {
      Log.console("Register Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> sendOtp({
    required BuildContext context,
    required String phone,
    required String countryCode,
    required String purpose,
  }) async {
    phoneNumber = phone;
    this.countryCode = countryCode;

    if (!validatePhoneNumber()) return;
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiService.login(
        phone: phoneNumber,
        countryCode: countryCode,
        purpose: purpose,
      );
      final data = jsonDecode(response.body);
      if (data["success"] == true) {
        Log.console(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpView(phone: phone, countryCode: countryCode, purpose: 'login'),
          ),
        );
      }
    } catch (e) {
      Log.console("Send OTP Error: $e");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> verifyOtp(BuildContext context, String phone, String countryCode, String otp) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.otpVerification(
        phone: phone,
        countryCode: countryCode,
        otp: otp,
        purpose: "login",
      );
      final data = jsonDecode(response.body);
      Log.console(response.body);
      if (data["success"] == true && data["data"] != null) {
        final token = data["data"]["verification_token"];
        if (token != null) {
          tempToken = token;
          if (phoneExists) {
            Navigator.pushNamed(context, AppRoutes.advertisement);
          } else {
            Navigator.pushNamed(context, AppRoutes.languageSelection);
          }
        }
      }
    } catch (e) {
      Log.console("Verify OTP Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> checkPhoneLive(String phone) async {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 600), () async {
      if (phone.length < 10) return;
      isCheckingPhone = true;
      notifyListeners();
      try {
        final response = await ApiService.checkPhone(phone: phone, countryCode: countryCode);
        final data = jsonDecode(response.body);
        Log.console(data);
        if (data["success"] == true) {
          phoneExists = data["data"]["exists"] ?? false;
          onboardingCompleted = data["data"]["onboarding_completed"];
        }
      } catch (e) {
        Log.console("Live Check Error: $e");
      }
      isCheckingPhone = false;
      notifyListeners();
    });
  }

  Future<void> loadLanguages() async {
    isLoadingLanguages = true;
    notifyListeners();
    try {
      final response = await ApiService.languages();
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true && data["data"] != null) {
        List<dynamic> list = data["data"];
        languages =
            list
                .map((e) => LanguageModel.fromJson(e))
                .where((lang) => lang.isActive == true)
                .toList()
              ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
        final savedCodes = await LanguageStorage.getLanguages();
        selectedLanguages = languages.where((lang) => savedCodes.contains(lang.code)).toList();
      } else {
        languages = [];
      }
    } catch (e) {
      languages = [];
      Log.console("Load Languages Error: $e");
    }
    isLoadingLanguages = false;
    notifyListeners();
  }

  void toggleLanguage(LanguageModel lang) {
    if (selectedLanguages.contains(lang)) {
      selectedLanguages.remove(lang);
    } else {
      selectedLanguages.add(lang);
    }
    LanguageStorage.saveLanguages(selectedLanguages.map((e) => e.code).toList());
    notifyListeners();
  }

  void removeLanguage(LanguageModel lang) {
    selectedLanguages.remove(lang);
    LanguageStorage.saveLanguages(selectedLanguages.map((e) => e.code).toList());
    notifyListeners();
  }

  void toggleTempLanguage(LanguageModel lang) {
    final exists = tempSelectedLanguages.any((l) => l.code == lang.code);
    if (exists) {
      tempSelectedLanguages.removeWhere((l) => l.code == lang.code);
    } else {
      tempSelectedLanguages.add(lang);
    }
    notifyListeners();
  }

  void removeTempLanguage(LanguageModel lang) {
    tempSelectedLanguages.removeWhere((l) => l.code == lang.code);
    notifyListeners();
  }

  void applyLanguageSelection() {
    selectedLanguages = List.from(tempSelectedLanguages);
    notifyListeners();
  }

  void loadTempFromSelectedLanguages() {
    tempSelectedLanguages = List.from(selectedLanguages);
    notifyListeners();
  }

  Future<void> searchLanguages(String input) async {
    if (input.isEmpty) {
      await loadLanguages();
      return;
    }
    final filtered = languages
        .where((lang) => lang.name.toLowerCase().contains(input.toLowerCase()))
        .toList();
    languages = filtered;
    notifyListeners();
  }

  Future<void> loadLocations() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiService.locations();
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true && data["data"] != null) {
        List<dynamic> list = data["data"];
        locations = list.map((e) => LocationModel.fromJson(e)).where((loc) => true).toList()
          ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
      } else {
        locations = [];
      }
    } catch (e) {
      locations = [];
      Log.console("Load Locations Error: $e");
    }
    isLoading = false;
    notifyListeners();
  }

  void selectLocation(LocationModel loc) {
    selectedLocation = loc;
    notifyListeners();
  }

  void clearLocation() {
    selectedLocation = null;
    notifyListeners();
  }

  void toggleTempLocation(LocationModel loc) {
    final exists = tempSelectedLocations.any((l) => l.id == loc.id);
    if (exists) {
      tempSelectedLocations.removeWhere((l) => l.id == loc.id);
    } else {
      tempSelectedLocations.add(loc);
    }
    notifyListeners();
  }

  void removeTempLocation(LocationModel loc) {
    tempSelectedLocations.removeWhere((l) => l.id == loc.id);
    notifyListeners();
  }

  void applySelection() {
    selectedLocations = List.from(tempSelectedLocations);
    notifyListeners();
  }

  void loadTempFromSelected() {
    tempSelectedLocations = List.from(selectedLocations);
    notifyListeners();
  }

  void clearTemp() {
    tempSelectedLocations = List.from(selectedLocations);
    notifyListeners();
  }

  Future<void> searchLocations(String input) async {
    if (input.isEmpty) {
      await loadLocations();
      return;
    }
    isLoading = true;
    notifyListeners();
    try {
      if (locations.isEmpty) {
        await loadLocations();
      }
      final filtered = locations.where((loc) {
        final cityMatch = loc.city.toLowerCase().contains(input.toLowerCase());
        final stateMatch = loc.state.toLowerCase().contains(input.toLowerCase());
        return cityMatch || stateMatch;
      }).toList();
      locations = filtered;
    } catch (e) {
      locations = [];
      Log.console("Search Locations Error: $e");
    }
    isLoading = false;
    notifyListeners();
  }

  void toggleLocation(LocationModel loc) {
    if (selectedLocations.contains(loc)) {
      selectedLocations.remove(loc);
    } else {
      selectedLocations.add(loc);
    }
    LanguageStorage.saveLanguages(selectedLocations.map((e) => e.id).toList());
    notifyListeners();
  }

  void removeLocation(LocationModel loc) {
    selectedLocations.remove(loc);
    LanguageStorage.saveLanguages(selectedLocations.map((e) => e.id).toList());
    notifyListeners();
  }

  void selectSingleLanguage(LanguageModel lang) {
    selectedLanguages.clear();
    selectedLanguages.add(lang);

    languages.removeWhere((l) => l.code == lang.code);
    languages.insert(0, lang);

    LanguageStorage.saveLanguages([lang.code]);
    notifyListeners();
  }
}
