import 'package:flutter/material.dart';

class ProfileInfoTexts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final userName = Container(
      margin: EdgeInsets.only(
        left: 10
      ),
      child: Text(
        "Pathum Tzoo",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Lato",
            fontSize: 20
        ),
      ),
    );

    final userEmail = Container(
      margin: EdgeInsets.only(
        left: 10
      ),
      child: Text(
        "pathumtzoo1@gmail.com",
        style: TextStyle(
            fontSize: 15,
            fontFamily: "Lato",
            color: Colors.black38
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userEmail
      ],
    );
  }

}