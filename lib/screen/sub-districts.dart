import 'package:crm/component/district-list.dart';
import 'package:crm/cron/app-district-notifier.dart';
import 'package:crm/model/district.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubDistricts extends StatefulWidget {
  final String districtName;
  final String districtId;

  const SubDistricts(
      {super.key, required this.districtName, required this.districtId});

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
          child: FutureBuilder<List<District>>(
              future: districts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<District> districts = snapshot.data ?? [];
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: 5 / 1,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: districts.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubDistricts(
                                  districtName: districts[index].district,
                                  districtId: districts[index].id)),
                        );
                      },
                      child: DistrictList(
                        name: districts[index].district,
                      ),
                    ),
                  );
                }
              }),
        ),
      );
    });
  }
}
