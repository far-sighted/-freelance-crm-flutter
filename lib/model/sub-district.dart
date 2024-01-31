import 'dart:convert';

class SubDistrict {
  String id;
  String districtId;
  String zone;

  SubDistrict({required this.id, required this.districtId, required this.zone});

  String get getSubDistrict => zone;
  set setSubDistrict(String subDistrict) => this.zone = subDistrict;

  factory SubDistrict.fromMap(Map<String, dynamic> map) {
    return SubDistrict(
      id: map['id'] as String,
      zone: map['zone'] as String,
      districtId: map['districtId'] as String,
    );
  }

  factory SubDistrict.fromJson(String source) =>
      SubDistrict.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SubDistrict(id: $id, zone: $zone, districtId: $districtId)';
}
