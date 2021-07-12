import 'package:flutter/material.dart';
import 'package:placess_2021/src/screens/login_screen.dart';

Future<void> main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Places",
      theme: ThemeData.light(),
      home: LoginScreen(),
    );
  }
}