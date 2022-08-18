import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

//import 'package:myapp/database/db_helper.dart';



class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _userController = new TextEditingController();
  TextEditingController _telephoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _password2Controller = new TextEditingController();

  bool _passwordVisible = false;
  bool _password2Visible = false;

  @override
  void initState() {
    _passwordVisible = false;
    _password2Visible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Now'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: ''),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Choose your username',
                        hintText: ''),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _telephoneController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telephone number',
                        hintText: ''),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _password2Controller,
                    obscureText: !_password2Visible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm your password',
                      hintText: '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _password2Visible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _password2Visible = !_password2Visible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () async {
                SharedPreferences users = await SharedPreferences.getInstance();
                users.setString('email', _emailController.text);
                users.setString('password', _passwordController.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin()));
                },
                child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: Text('Register',
                        style: TextStyle(color: Colors.white, fontSize: 26))),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500.0),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
/*implementation platform('com.google.firebase:firebase-bom:30.3.1')


  // Add the dependency for the Firebase SDK for Google Analytics
  // When using the BoM, don't specify versions in Firebase dependencies
  implementation
Future<void> SaveNewUser({required String newemail, required String newusername, required String newtelephone, required String newpassword}) async {
  Database database = await openDatabase('users.db', version: 1,
    onCreate: (Database db, int version) async {
  // When creating the db, create the table
  await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT UNIQUE, username TEXT UNIQUE, telephone TEXT UNIQUE, password TEXT)');
});

// Insert some records in a transaction
await database.transaction((txn) async {
  int id1 = await txn.rawInsert(
      'INSERT INTO users(email, username, telephone, password) VALUES($newemail, $newusername, $newtelephone, $newpassword)');
});
/*
// Update some record
int count = await database.rawUpdate(
    'UPDATE Test SET name = ?, value = ? WHERE name = ?',
    ['updated name', '9876', 'some name']);
print('updated: $count');

// Get the records
List<Map> list = await database.rawQuery('SELECT * FROM Test');
List<Map> expectedList = [
  {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
  {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
];*/
}*/