import 'package:crm/model/district.dart';
import 'package:crm/screen/districts.dart';
import 'package:flutter/material.dart';

class DrawerNavigationItems extends StatelessWidget {
  final List<District> districts;
  const DrawerNavigationItems({super.key, required this.districts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Districts',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondaryContainer)),
          const Padding(padding: EdgeInsets.all(8.0)),
          ListTile(
            title: const Text("Home Page"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Districts(),
              ));
            },
          ),
          if (districts.isNotEmpty)
            ...districts.map((e) => ListTile(
                  title: Text("Bezrik ${e.getDistrict}"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
        ],
      ),
    );
  }
}
