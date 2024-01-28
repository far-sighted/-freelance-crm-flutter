import 'package:crm/model/district.dart';
import 'package:crm/service/district.service.dart';
import 'package:flutter/material.dart';

class AppDistrictNotifier extends ChangeNotifier {
  late Future<List<District>> _districts;

  Future<List<District>> get districts => _districts;

  AppDistrictNotifier() {
    _districts = DistrictService().fetchData();
  }
}
