import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/homepage.dart';



class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {

  int _indexOfPageBottomBar = 0;

  @override
  Widget build(BuildContext context) {
    
    Widget myNavigationBarWidget;

    return BottomNavigationBar(
      onTap: (int value) { 
        _indexOfPageBottomBar=value;
        if (_indexOfPageBottomBar==0){
          myNavigationBarWidget = const Scaffold(body: Text('page 1'));
        }
        else if (_indexOfPageBottomBar==1){
          myNavigationBarWidget = const Scaffold(body: Text('page 2'));
        }
        else if (_indexOfPageBottomBar==2){
          myNavigationBarWidget = const Scaffold(body: Text('page 3'));
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        )
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
