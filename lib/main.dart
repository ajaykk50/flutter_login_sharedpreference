import 'package:flutter/material.dart';
import 'package:flutter_splash_login/screen_splash.dart';

const SAVE_KEY_NAME = "UserLoggedIn";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
