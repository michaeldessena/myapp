

import 'package:flutter/material.dart';

class HomePageFirstTab extends StatefulWidget {

  final String searchResult = '';
  bool addSearchResult = false;

  HomePageFirstTab({Key? key, searchResult, addSearchResult}){
    searchResult = searchResult;
    if (searchResult != null){
    addSearchResult = true;
    }
    else {
      addSearchResult = false;
    }
  }

  @override
  State<StatefulWidget> createState() {

    return StateHomePageFirstTab(searchResult: searchResult, addSearchResult: addSearchResult);
  }
}

class StateHomePageFirstTab extends State<HomePageFirstTab> {

  String searchResult = '';
  bool addSearchResult = false;

  StateHomePageFirstTab({Key? key, required String searchResult, required bool addSearchResult}){
    addSearchResult = addSearchResult;
    searchResult = searchResult;
  }

  @override
  Widget build(BuildContext context) {
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        addSearchResult ? Text(searchResult) : Text('No choice'),
      ],
    );
    ;
  }
}
