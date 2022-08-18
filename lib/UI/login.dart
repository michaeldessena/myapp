import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';
import 'homepage.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

/*LOCAL DATABASE*/
import 'package:flutter/widgets.dart';
//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';

class UserLogin extends StatefulWidget {
  UserLogin({Key? key, this.title = 'Login'}) : super(key: key);

  String title = 'Login';

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  late String errormsg;
  late bool error, showprogress, success;
  late String email, username, telephone, password;

  TextEditingController _userController = new TextEditingController(); // text from the TextField
  TextEditingController _passwordController = new TextEditingController();

  // function to start the login process
  startUserLogin() async {
    String apiurl = "http://10.255.30.134/myapp/login.php";
    print(_userController);

    var response = await http.post(Uri.parse(apiurl), body: {
      'email': email, //get the email text
      'username': username, //get the username text
      'telephone': telephone, //get the telephone text
      'password': password //get password text
    });

    print(email);
    print(username);
    print(telephone);
    print(password);

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);

      print('JSONDATA:');
      print(jsondata["id"]);
      print(jsondata["email"]);
      print(jsondata["username"]);
      print(jsondata["telephone"]);
      print(jsondata["password"]);

      print(response.body);
      if (jsondata["error"]) {
        setState(() {
          showprogress = false;
          error = true;
          errormsg = jsondata["message"];
        });
      } else {
        if (jsondata["success"]) {
          setState(() {
            success = true;
            error = false;
            showprogress = false;
          });
          //save the data
          String uid = jsondata["id"];
          String uemail = jsondata["email"];
          String uusername = jsondata["username"];
          String utelephone = jsondata["telephone"];
          String upassword = jsondata["password"];
          print(uid);
          print(uemail);
          print(uusername);
          print(utelephone);
          print(upassword);
        } else {
          showprogress = false;
          error = true;
          errormsg = "Something went wrong";
        }
      }
    }
  }

  @override
  void initState() {
    email = "";
    username = "";
    telephone = "";
    password = "";
    errormsg = "";
    error = false;
    success = false;
    showprogress = false;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //show error message here
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(10),
                child: error ? errmsg(errormsg) : Container(),
                //if error == true then show error message
                //else set empty container as child
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _userController,
                    onChanged: (value) {
                      username = value;
                      email = value;
                      telephone = value;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email, Username, Telephone',
                        hintText: ''),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _passwordController, // here is saved
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: ''),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  onPressed: () async {
                    //
                    setState(() {
                      showprogress = true;
                    });
                    startUserLogin();

                    if (success) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage())); // How To Navigate throught pages

                      SharedPreferences users =
                          await SharedPreferences.getInstance();
                      users.setString('email', _userController.text);
                      users.setString('password', _passwordController.text);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500.0),
                        side: const BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: showprogress
                        ? const SizedBox(
                            height: 30,
                            width: 60,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.orange,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          )
                        : const Text('Login',
                            style:
                                TextStyle(color: Colors.black, fontSize: 26)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserRegister())); // How To Navigate throught pages
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500.0),
                        side: const BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Text('Register Now',
                          style:
                              TextStyle(color: Colors.orange, fontSize: 26))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
class NewPage extends StatelessWidget {
  NewPage({Key? key, required this.user}) : super(key: key);

  String user = '';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Text('Hello ${user}'),
    );
  }
}

*/

Widget errmsg(String text) {
  //error message widget.
  return Container(
    padding: const EdgeInsets.all(15.00),
    margin: const EdgeInsets.only(bottom: 10.00),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.orange,
        border: Border.all(color: Colors.orange, width: 2)),
    child: Row(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 6.00),
        child: const Icon(Icons.info, color: Colors.white),
      ), // icon for error message

      Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
      //show error message text
    ]),
  );
}
