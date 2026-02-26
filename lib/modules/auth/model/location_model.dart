class LocationModel {
  final String id;
  final String countryCode;
  final String state;
  final String city;
  final double latitude;
  final double longitude;
  final String tier;
  final bool isPopular;
  final int sortOrder;

  LocationModel({
    required this.id,
    required this.countryCode,
    required this.state,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.tier,
    required this.isPopular,
    required this.sortOrder,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json["id"],
      countryCode: json["country_code"],
      state: json["state"],
      city: json["city"],
      latitude: (json["latitude"] ?? 0).toDouble(),
      longitude: (json["longitude"] ?? 0).toDouble(),
      tier: json["tier"] ?? "",
      isPopular: json["is_popular"] ?? false,
      sortOrder: json["sort_order"] ?? 0,
    );
  }
}