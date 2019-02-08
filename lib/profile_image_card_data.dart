import 'package:flutter/material.dart';
import 'floating_action_button_green.dart';

class ProfileImageCardData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment(0.9, 2.5),
      children: <Widget>[
        Container(
          width: 250,
          padding: EdgeInsets.all(10),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.7)
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Knuckles Mountains Range",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Descripton of place with some basic information and references required for the application",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: "Lato",
                    color: Colors.black38,
                ),
              ),
              Text(
                "Steps 123, 123, 123",
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lato"
                ),
              )
            ],
          ),
        ),
        FloatingActionButtonGreen()
      ],
    );
  }

}