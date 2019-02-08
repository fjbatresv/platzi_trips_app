import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget{

  String pathImage = "assets/img/traveler_couple.jpg";

  CirclePhoto(this.pathImage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 15.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white
          ),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(this.pathImage)
          )
      ),
    );
  }

}