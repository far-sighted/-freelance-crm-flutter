import 'package:crm/cron/app-district-notifier.dart';
import 'package:crm/model/district.dart';
import 'package:crm/screen/sub-districts.dart';
import 'package:flutter/material.dart';
import 'package:crm/component/district-card.dart';
import 'package:crm/component/side-drawer.dart';
import 'package:provider/provider.dart';

class Districts extends StatefulWidget {
  const Districts({Key? key}) : super(key: key);

  @override
  State<Districts> createState() => _DistrictsState();
}

class _DistrictsState extends State<Districts> {
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
            title: const Text('Districts'),
          ),
          drawer: const SideDrawer(),
          body: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder<List<District>>(
              // Fix 2
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
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: districts.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SubDistricts(
                                      districtName:
                                          districts[index].getDistrict,
                                      districtId: districts[index].id),
                                ),
                              );
                            },
                            child: DistrictCard(
                                name: districts[index].getDistrict),
                          ));
                }
              },
            ),
          ));
    });
  }
}
