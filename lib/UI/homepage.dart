import 'package:flutter/material.dart';
import 'package:myapp/UI/homepage_firstTab.dart';
import 'searchbar.dart';

//import 'myNavigationBar.dart';
import 'settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexOfPageBottomBar = 0; // index for the page you are on

  @override
  Widget build(BuildContext context) {
    Widget? myNavigationBarWidget;

    if (_indexOfPageBottomBar == 0) {
      myNavigationBarWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 35),
              child: Text('Application built using:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 167, 163, 163),
                      fontSize: 22,
                      fontFamily: 'RobotoMono')),
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: FlutterLogo(),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Text('by Michael Dessena',
                  style: TextStyle(
                    color: Color.fromARGB(255, 167, 163, 163),
                    fontSize: 18,
                  )),
            ),
          ),
        ],
      );
    } else if (_indexOfPageBottomBar == 1) {
      myNavigationBarWidget = Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.orange,
          child: const FlutterLogo(),
        ),
      );
    } else if (_indexOfPageBottomBar == 2) {
      myNavigationBarWidget = const Settings();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('MyApplication'),
      actions: [
          IconButton(
            onPressed: () async {
              // method to show the search bar
              var myChoiche = await showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
              );
              
              

            },
            icon: const Icon(Icons.search),
          )
        ],
    ),
      body: myNavigationBarWidget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _indexOfPageBottomBar = newIndex),
        currentIndex: _indexOfPageBottomBar,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
