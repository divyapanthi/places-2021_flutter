import 'package:flutter/material.dart';
import 'package:placess_2021/src/core/providers.dart';
import 'package:placess_2021/src/screens/dashboard/dashboard_screen.dart';
import 'package:placess_2021/src/screens/auth/login_screen.dart';
import 'package:placess_2021/src/screens/dashboard/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
        child: MaterialApp(
        theme: ThemeData.light(),
        home: SplashScreen(),
      ),
    );
  }
}
