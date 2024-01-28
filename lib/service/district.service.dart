import 'dart:convert';

import 'package:crm/model/district.dart';
import 'package:http/http.dart' as http;

class DistrictService {
  Uri uri;

  DistrictService()
      : uri = Uri.https(
          "65b2ee529bfb12f6eafe8e75.mockapi.io",
          "/disctricts",
        );

  Future<List<District>> fetchData() async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<District> districts =
          jsonData.map((item) => District.fromMap(item)).toList();
      return districts;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
