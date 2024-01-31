import 'package:crm/component/side-drawer.dart';
import 'package:flutter/material.dart';
import 'package:crm/model/sub-district.dart';
import 'package:crm/component/district-list-item.dart';
import 'package:crm/service/sub-district.service.dart';
import 'package:crm/screen/client-list.dart';

class SubDistricts extends StatefulWidget {
  final String districtName;
  final String districtId;

  const SubDistricts(
      {super.key, required this.districtName, required this.districtId});

  @override
  State<SubDistricts> createState() => _SubDistrictsState();
}

class _SubDistrictsState extends State<SubDistricts> {
  late Future<List<SubDistrict>> _subDistrictsFuture;

  @override
  void initState() {
    super.initState();
    _subDistrictsFuture = SubDistrictService(id: widget.districtId).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bezirk ${widget.districtName}'),
      ),
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder<List<SubDistrict>>(
            future: _subDistrictsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<SubDistrict> subDistricts = snapshot.data ?? [];
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 5 / 1,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: subDistricts.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ClientList(
                                  zone: subDistricts[index].zone,
                                  id: subDistricts[index].id)),
                        );
                      },
                      child: DistrictListItem(name: subDistricts[index].zone)),
                );
              }
            }),
      ),
    );
  }
}
