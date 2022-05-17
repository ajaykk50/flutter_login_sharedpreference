import 'package:flutter/material.dart';
import 'package:flutter_splash_login/screen_first.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              SignOut(context);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SafeArea(child: Center(child: Text("Home Page"))),
    );
  }

  SignOut(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => FirstScreen()), (route) => false);

    final _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.clear();
  }
}
