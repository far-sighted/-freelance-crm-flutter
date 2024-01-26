import 'package:flutter/material.dart';

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
      drawer: const Drawer(),
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

class DistrictCard extends StatelessWidget {
  final String name;

  const DistrictCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Bezrik",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
