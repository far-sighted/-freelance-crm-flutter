import 'package:crm/cron/app-district-notifier.dart';
import 'package:flutter/material.dart';
import 'package:crm/model/district.dart';
import 'package:crm/model/user.dart';
import 'package:crm/widget/drawer-header.dart';
import 'package:crm/widget/drawer-navigation-items.dart';
import 'package:crm/widget/drawer-theme-switcher.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  User currentUser = User(
    id: 1,
    userid: "OBJECT(id)",
    username: "Username",
    email: "Email",
    avatar:
        "https://buzzly.info/upload/1769/5705d4c005efeff0ce92ec1ec57ac130.jpg",
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<District>> districts =
        Provider.of<AppDistrictNotifier>(context).districts;

    return Drawer(
      width: 375.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: DrawerHeaderCustom(
              email: currentUser.email,
              username: "@${currentUser.username}",
              avatar: currentUser.avatar,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                FutureBuilder<List<District>>(
                  future: districts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return DrawerNavigationItems(
                          districts: snapshot.data ?? []);
                    }
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: const ThemeSwitcher(),
          )
        ],
      ),
    );
  }
}
