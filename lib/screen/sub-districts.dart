import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubDistricts extends StatefulWidget {
  final String districtName;
  final String districtId;

  SubDistricts({required this.districtName, required this.districtId});

  @override
  _SubDistrictState createState() => _SubDistrictState();
}

class _SubDistrictState extends State<SubDistricts> {
  List<dynamic> subDistrictData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://65b2ee529bfb12f6eafe8e75.mockapi.io/disctricts/'));

    if (response.statusCode == 200) {
      setState(() {
        subDistrictData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load sub-district data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SubDistrict - ${widget.districtName}'),
      ),
      body: Center(
        child: subDistrictData.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: subDistrictData.length,
                itemBuilder: (context, index) {
                  final subDistrict = subDistrictData[index];
                  return ListTile(
                    title: Text(subDistrict['subDistrictName']),
                    subtitle: Text('ID: ${subDistrict['subDistrictId']}'),
                  );
                },
              ),
      ),
    );
  }
}
