import 'package:flutter/material.dart';
import 'package:flutter_splash_login/main.dart';
import 'package:flutter_splash_login/screen_first.dart';
import 'package:flutter_splash_login/screen_second.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    chekLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.asset('assets/Image_splash.png'),
      )),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return FirstScreen();
    }));
  }

  Future<void> chekLogin() async {
    final _sharedPref = await SharedPreferences.getInstance();
    final userloggedIn = _sharedPref.get(SAVE_KEY_NAME);

    if (userloggedIn == null || userloggedIn == false) {
      gotoLogin();
    } else {
      await Future.delayed(Duration(seconds: 4));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return SecondScreen();
      }));
    }
  }
}
