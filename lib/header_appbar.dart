import 'package:flutter/material.dart';
import 'gradient_background.dart';
import 'image_card_list.dart';

class HeaderAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBackground("Bienvenido"),
        ImageCardList(6)
      ],
    );
  }
}