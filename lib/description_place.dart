import 'package:flutter/material.dart';
import 'button_purple.dart';

class DescriptionPlace extends StatelessWidget {

  String name;
  String description;
  int stars;

  DescriptionPlace(this.name, this.description, this.stars);

  @override
  Widget build(BuildContext context) {
    //Title
    Widget star(bool filled) {
      return Container(
        margin: EdgeInsets.only(
          top: 353.0,
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

    final description = Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0
      ),
      child: Text(
          this.description,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
      ),
    );

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

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 350.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            this.name,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              fontFamily: "Lato"
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: createStars(),
        )
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        description,
        ButtonPurple("Navigate")
      ],
    );
  }

}