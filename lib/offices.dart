import 'dart:convert';
import 'package:http/http.dart' as http;


class OfficesList {
  List<Office> offices;
  OfficesList({required this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List;
    List<Office> officesList =
        officesJson.map((office) => Office.fromJson(office)).toList();
    return OfficesList(offices: officesList);
  }
}

class Office {
  String name;
  String address;
  String city;
  String country;
  String lat;
  String lng;
  String image;

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

Future<OfficesList> getOfficesList() async {
  final url = Uri.parse('https://about.google/static/data/locations.json');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load offices: ${response.statusCode}');
  }
}
