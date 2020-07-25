import 'package:app_citas/pages/dashboad_page.dart';
import 'package:app_citas/utils/user_preferences.dart';

import 'blocs/provider.dart';
import 'theme/default_theme.dart';
import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaulTheme,
        // initialRoute: (prefs.token == '') ? 'login' : 'dashboard',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'dashboard': (BuildContext context) => DashBoardPage()
        },
      ),
    );
  }
}
