import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'homepage.dart';
import 'login.dart';


class SplashScreen extends StatefulWidget {
  //static const String splashRoute = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timeToShowSplashScreenOnScreen() async {
    Timer(const Duration(seconds: 2), () async {
      if (!mounted) return;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.containsKey('email') && prefs.containsKey('password');
      if (isLoggedIn) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserLogin() ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    timeToShowSplashScreenOnScreen();
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height: 100,
            width: 100,
            child: FlutterLogo(),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Text('App Starting ...',
                  style: TextStyle(
                      color: Color.fromARGB(255, 167, 163, 163), fontSize: 18,)),
            ),
          ),
        ],
      )
      );
  }
}
