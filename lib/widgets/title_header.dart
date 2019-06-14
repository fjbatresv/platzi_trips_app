import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  const TitleHeader({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      this.title,
      style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold),
    );
  }
}
