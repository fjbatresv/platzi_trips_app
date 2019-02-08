import 'package:flutter/material.dart';
import 'circle_photo.dart';
import 'profile_info_texts.dart';

class ProfileInfo extends StatelessWidget{

  String pathImage = "assets/img/traveler_couple.jpg";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        CirclePhoto(this.pathImage),
        ProfileInfoTexts()
      ],
    );
  }

}