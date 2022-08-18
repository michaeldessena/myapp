//import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'dart:async';

/*LOCAL DATABASE*/
import 'package:flutter/widgets.dart';
import 'package:myapp/UI/homepage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:sqflite/sqflite.dart';

import 'UI/login.dart';

import 'utils/colors.dart';
import 'UI/splash.dart';

import 'UI/loginExemple.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? theme = prefs.getBool('isDarkThemeOn');

  // load here the preferences
  // Now the set theme is saved!!

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static late final ValueNotifier<ThemeMode> themeNotifier; //= ValueNotifier(ThemeMode.light);
  late final bool theme;// = false;

  MyApp({Key? key, bool? theme}) : super(key: key) {
    theme = theme;
    themeNotifier = ValueNotifier(theme! ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
              // Remove the debug banner
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                /* light theme settings */
                primarySwatch: primarySwatchLight,
                appBarTheme: AppBarTheme(color: Colors.orange),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.orange),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                /* dark theme settings */
                primarySwatch: primarySwatchDark,
                appBarTheme: AppBarTheme(color: primarySwatchDark),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: primarySwatchDark),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: primarySwatchDark),
                switchTheme: SwitchThemeData(
                  trackColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    return primarySwatchDark;
                  }),
                  thumbColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => Colors.white),
                ),
              ),
              themeMode: currentMode,
              home: const SplashScreen(),//LoginPage() //SafeArea(child : const SplashScreen()) //UserLogin(),
              );
        });
  }
}
