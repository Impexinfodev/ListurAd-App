class LanguageModel {
  final String code;
  final String name;
  final String nativeName;
  final bool isActive;
  final int sortOrder;
  final String createdAt;
  final String? flagCode;

  LanguageModel({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.isActive,
    required this.sortOrder,
    required this.createdAt,
    this.flagCode,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      code: json["code"] ?? "",
      name: json["name"] ?? "",
      nativeName: json["native_name"] ?? "",
      isActive: json["is_active"] ?? false,
      sortOrder: json["sort_order"] ?? 0,
      createdAt: json["created_at"] ?? "",
      flagCode: json["flag_code"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
      "native_name": nativeName,
      "is_active": isActive,
      "sort_order": sortOrder,
      "created_at": createdAt,
      "flag_code": flagCode,
    };
  }
}