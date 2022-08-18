import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Settings_Settings extends StatefulWidget {
  const Settings_Settings({Key? key}) : super(key: key);

  @override
  State<Settings_Settings> createState() => _StateSettings_Settings();
}

class _StateSettings_Settings extends State<Settings_Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 192, 191, 191), width: 1))),
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
              child: Row(children: <Widget>[
                const SizedBox(width: 8),
                const Icon(
                  Icons.settings,
                  size: 22,
                ),
                const SizedBox(width: 40),
                const Text(
                  'Theme',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 50),
                
                Expanded(
                  child:
                    IconButton(
                        
                        color: MyApp.themeNotifier.value == ThemeMode.light
                            ? Colors.grey
                            : Colors.yellow,
                        iconSize: 22,
                        icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                            ? Icons.dark_mode
                            : Icons.light_mode),
                        onPressed: () {
                          MyApp.themeNotifier.value =
                              MyApp.themeNotifier.value == ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                        }),
                ),
              ]),
            ),
          ),
          Container(
            //padding:
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 192, 191, 191), width: 1))),
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
              child: Row(children: const <Widget>[
                SizedBox(width: 8),
                Icon(
                  Icons.account_box,
                  size: 22,
                ),
                SizedBox(width: 40),
                Text(
                  'User',
                  style: TextStyle(fontSize: 20),
                )
              ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 192, 191, 191), width: 1))),
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
              child: Row(children: const <Widget>[
                SizedBox(width: 8),
                Icon(
                  Icons.logout,
                  size: 22,
                ),
                SizedBox(width: 40),
                Text(
                  'Logut',
                  style: TextStyle(fontSize: 20),
                )
              ]),
            ),
          ),
        ]));
  }
}
