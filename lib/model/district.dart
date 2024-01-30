import 'dart:convert';

class District {
  String id;
  String district;

  District({required this.id, required this.district});

  String get getDistrict => district;
  set setDistrict(String district) => this.district = district;

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['id'] as String,
      district: map['district'] as String,
    );
  }

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'District(id: $id, district: $district)';
}
