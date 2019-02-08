import 'package:flutter/material.dart';

class ProfileButtonRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: FloatingActionButton(
              child: Icon(Icons.bookmark_border),
              backgroundColor: Colors.white,
              foregroundColor: Colors.indigo,
              mini: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20
            ),
            child: FloatingActionButton(
              child: Icon(Icons.card_giftcard),
              backgroundColor: Colors.white54,
              foregroundColor: Colors.indigo,
              mini: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 20
            ),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.white,
              foregroundColor: Colors.indigo,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 20
            ),
            child: FloatingActionButton(
              child: Icon(Icons.mail_outline),
              backgroundColor: Colors.white54,
              foregroundColor: Colors.indigo,
              mini: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 20
            ),
            child: FloatingActionButton(
              child: Icon(Icons.person),
              backgroundColor: Colors.white54,
              foregroundColor: Colors.indigo,
              mini: true,
            ),
          ),
        ],
      ),
    );
  }

}