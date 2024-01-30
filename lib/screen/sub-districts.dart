import 'package:crm/cron/app-district-notifier.dart';
import 'package:crm/model/district.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubDistricts extends StatefulWidget {
  final String districtName;
  final String districtId;

  SubDistricts({required this.districtName, required this.districtId});

  @override
  State<SubDistricts> createState() => _SubDistrictsState();
}

class _SubDistrictsState extends State<SubDistricts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppDistrictNotifier>(builder: (context, state, child) {
      Future<List<District>> districts = state.districts;
      return Scaffold(
        appBar: AppBar(
          title: Text('Bezirk ${widget.districtName}'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: const Center(
            child: Text('SubDistricts Page Content'),
          ),
        ),
      );
    });
  }
}
