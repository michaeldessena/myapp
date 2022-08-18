import 'package:flutter/material.dart';

/// stateful widget that the main application instantiates
class OnOffButton extends StatefulWidget {
  const OnOffButton({Key? key}) : super(key: key);

  @override
  State<OnOffButton> createState() => _OnOffButtonState();
}

/// private State class that goes with OnOffButton
class _OnOffButtonState extends State<OnOffButton> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}