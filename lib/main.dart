import 'package:crm/cron/app-district-notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:crm/theme/palette.dart';
import 'package:crm/cron/app-theme-notifier.dart';
import 'package:crm/screen/login.dart';

void main() {
  runApp(const Crm());
}

class Crm extends StatelessWidget {
  const Crm({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeNotifier()),
        ChangeNotifierProvider(create: (context) => AppDistrictNotifier())
      ],
      child: Consumer<AppThemeNotifier>(builder: (context, state, child) {
        ThemeMode currentTheme =
            state.isDarkTheme ? ThemeMode.dark : ThemeMode.light;

        return MaterialApp(
          title: 'Content Relationship Management',
          debugShowCheckedModeBanner: false,
          home: const Login(),
          theme: MaterialTheme().light(),
          darkTheme: MaterialTheme().dark(),
          themeMode: currentTheme,
        );
      }),
    );
  }
}


/**
 


      
 
 */