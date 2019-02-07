import 'package:flutter/material.dart';

class Star extends StatelessWidget{

  int stars;

  Star(this.stars);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget star(bool filled) {
      return Container(
        margin: EdgeInsets.only(
          top: 3.0,
          right: 3.0,
        ),
        child: filled ? Icon(
          Icons.star,
          color: Color(0xFFf2c611),
        ) : Icon(
          Icons.star_border,
          color: Colors.black38,
        ),
      );
    }

    List<Widget> createStars(){
      var starIcons = <Widget>[];
      for (int i = 0; i < 5; i++) {
        if (i < this.stars){
          starIcons.add(star(true));
        }else{
          starIcons.add(star(false));
        }
      }
      return starIcons;
    }

    return Row(
      children: createStars(),
    );
  }

}