import 'package:flutter/material.dart';
import 'package:crm/model/user.dart';
import 'package:crm/widget/drawer-theme-switcher.dart';
import 'package:crm/widget/drawer-header.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  User currentUser = User(
    id: 1,
    userid: "OBJECT(id)",
    username: "username",
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
    return Drawer(
        width: 375.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Container(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(
            children: <Widget>[
              DrawerHeaderCustom(
                email: currentUser.email,
                username: "@${currentUser.username}",
                avatar: currentUser.avatar,
              ),
              const Divider(),
              // const DrawerNavigationItems(),
              const Divider(),
              const ThemeSwitcher()
            ],
          ),
        ));
  }
}
