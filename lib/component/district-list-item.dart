import 'package:flutter/material.dart';

class DistrictListItem extends StatelessWidget {
  final String name;

  const DistrictListItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 1,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 14.0),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18.0),
            ],
          ),
        ),
      ),
    );
  }
}
