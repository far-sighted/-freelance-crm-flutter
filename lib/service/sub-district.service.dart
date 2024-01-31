import 'dart:convert';

import 'package:crm/model/sub-district.dart';
import 'package:http/http.dart' as http;

class SubDistrictService {
  String id;
  Uri uri;

  SubDistrictService({required this.id})
      : uri = Uri.https(
          "65b2ee529bfb12f6eafe8e75.mockapi.io",
          "/disctricts/$id/zones",
        );

  Future<List<SubDistrict>> fetchData() async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<SubDistrict> subDistricts =
          jsonData.map((item) => SubDistrict.fromMap(item)).toList();
      return subDistricts;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
