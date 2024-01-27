import 'package:flutter/material.dart';
import 'package:crm/component/district-card.dart';
import 'package:crm/component/side-drawer.dart';

class Districts extends StatefulWidget {
  const Districts({Key? key}) : super(key: key);

  @override
  State<Districts> createState() => _DistrictsState();
}

class _DistrictsState extends State<Districts> {
  // Define a list of German districts
  final List<String> germanDistricts = [
    'Sud',
    'Sudwest',
    'Mitte',
    'Nord',
    'West',
    'Nordwest',
    'Ost',
    'Sudost',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Districts'),
      ),
      drawer: const SideDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the number of columns as needed
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: germanDistricts.length,
        itemBuilder: (context, index) {
          return DistrictCard(name: germanDistricts[index]);
        },
      ),
    );
  }
}


