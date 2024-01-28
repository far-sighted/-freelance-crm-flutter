import 'package:flutter/material.dart';

class DistrictCard extends StatelessWidget {
  final String name;

  const DistrictCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.elliptical(4.0, 4.0)),
      ),
    
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
