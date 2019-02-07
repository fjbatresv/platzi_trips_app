import 'package:flutter/material.dart';
import 'package:platzi_trips_app/stars.dart';

class Review extends StatelessWidget{

  String pathImage = "assets/img/traveler.jpg";
  String userName = "Varuna Yasas";
  String details = "1 review - 5 photos";
  String comment = "There is an amazing place in Sri Lanka";

  Review(this.pathImage, this.userName, this.details, this.comment);

  @override
  Widget build(BuildContext context) {

    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
          this.userName,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 17.0,
            fontFamily: "Lato"
          ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        this.details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 13.0,
            fontFamily: "Lato",
            color: Color(0xFFa3a5a7)
        ),
      ),
    );

    final userComment = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        this.comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 13.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.w900
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        Row(
          children: <Widget>[
            userInfo,
            Star(3)
          ],
        ),
        userComment
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 15.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(this.pathImage)
          )
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails
      ],
    );
  }

}