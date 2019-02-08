import 'package:flutter/material.dart';
import 'profile_image_card_data.dart';

class ProfileImageCard extends StatelessWidget{

  String pathImage = "assets/img/paisaje1.jpg";

  ProfileImageCard(this.pathImage);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height:200.0,
      width: 400.0,
      margin: EdgeInsets.only(
        bottom: 80
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(this.pathImage)
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.7)
            )
          ]
      ),
    );

    return Stack(
      alignment: Alignment(0.1, 0.5),
      children: <Widget>[
        card,
        ProfileImageCardData(),
      ],
    );
  }

}