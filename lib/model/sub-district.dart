import 'dart:convert';

class SubDistrict {
  String id;
  String zone;
  String districtId;

  SubDistrict({required this.id, required this.districtId, required this.zone});

  String get getZone => zone;
  set setZone(String zone) => this.zone = zone;

  String get getDistrictId => districtId;
  set setDistrictId(String districtId) => this.districtId = districtId;

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
