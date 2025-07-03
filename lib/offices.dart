class OfficesList {
  List<Office> offices;
  OfficesList({required this.offices});
}

class Office {
  String name;
  String address;
  String city;
  String country;
  String lat;
  String lng;
  final String image;

  Office({
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    required this.lat,
    required this.lng,
    required this.image,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      image: json['image'] as String,
    );
  }
}