class ApiUrl {
  static const String baseUrl = "https://api.listurad.aashita.ai";

  static const register = "$baseUrl/api/v1/auth/register";
  static const sendOtp = "$baseUrl/api/v1/auth/otp/send";
  static const verifyOtp = "$baseUrl/api/v1/auth/otp/verify";
  static const checkPhone = "$baseUrl/api/v1/auth/check-phone";
  static const languages = "$baseUrl/api/v1/data/languages";
  static const locations = "$baseUrl/api/v1/data/locations";
}
