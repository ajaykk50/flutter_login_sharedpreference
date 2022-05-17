import 'package:flutter/material.dart';
import 'package:flutter_splash_login/main.dart';
import 'package:flutter_splash_login/screen_second.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _controller1 = TextEditingController();

  final _controller2 = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Username",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                  controller: _controller1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Value is empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                  controller: _controller2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Value is empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: Text(
                        "Username & Passwd mismatch",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          gotoSecondPage(context);
                        } else {
                          print("Data Empty");
                        }
                        _formKey.currentState?.validate();
                      },
                      child: const Text("Login"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void gotoSecondPage(BuildContext context) async {
    if (_controller1.text == _controller2.text) {
      final _sharedPref = await SharedPreferences.getInstance();
      _sharedPref.setBool(SAVE_KEY_NAME, true);

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return SecondScreen();
      }));
    } else {
      final _errormessage = "Username & Passwd mismatch";

      //Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text(_errormessage),
        duration: Duration(seconds: 10),
      ));

      //AlertDialog

      showDialog(
          context: context,
          builder: (ctx1) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(_errormessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(ctx1);
                    },
                    child: Text("Close"))
              ],
            );
          });

      //Show Text
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
