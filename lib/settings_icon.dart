import 'package:flutter/material.dart';

class SettingsIcon extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingsIcon();
  }

}

class _SettingsIcon extends State<SettingsIcon>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white70,
            ),
          iconSize: 15,
        )
      ],
    );
  }

}