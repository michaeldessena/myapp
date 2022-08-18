import 'package:flutter/material.dart';
import 'package:myapp/UI/login.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'settings_settings.dart';
import 'package:myapp/main.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _StateSettings();
}

class _StateSettings extends State<Settings> {

  bool _theme = MyApp.themeNotifier.value == ThemeMode.light ? false : true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(




        body: SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Global'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
              ),
            SettingsTile.switchTile(
              onToggle: (value) async {
              setState(() {
                _theme = _theme ? false : true;  
              });
              // change the theme now!
              MyApp.themeNotifier.value = _theme ? ThemeMode.dark : ThemeMode.light;
              
              // save it for the next restart the theme is left unchanged
              SharedPreferences users = await SharedPreferences.getInstance();
              users.setBool('isDarkThemeOn', _theme);

              },
              initialValue: _theme,
              leading: const Icon(Icons.format_paint),
              title: const Text('Dark Mode'),
            ),
            SettingsTile(title: const Text('Logout'),
            onPressed: (context) async {
              logoutOnPressed();
            },
            )
          ],
        ),
      ],
    ),
    );
  }

  void logoutOnPressed() async {
    SharedPreferences users = await SharedPreferences.getInstance();

              
              print(users.getString('email'));
              print(users.getString('password'));

              await users.remove('email');
              await users.remove('password');

              //await Future.delayed(const Duration(seconds: 1));
              if (!mounted) return;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserLogin()));
  }
}




