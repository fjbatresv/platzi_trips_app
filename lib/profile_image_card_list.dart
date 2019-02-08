import 'package:flutter/material.dart';
import 'dart:math';
import 'profile_image_card.dart';

class ProfileImageCardList extends StatelessWidget{

  int quantity = 0;
  final _random = new Random();
  final images = ["assets/img/paisaje1.jpg", "assets/img/paisaje2.jpg", "assets/img/paisaje3.jpg", "assets/img/paisaje4.jpg", "assets/img/paisaje5.jpg"];

  ProfileImageCardList(this.quantity);

  @override
  Widget build(BuildContext context) {

    List<Widget> buildImageCards(){
      List<Widget> cards = [];
      for (int i = 0; i < this.quantity; i++){
        int image = 0 + _random.nextInt(images.length - 0);
        cards.add(ProfileImageCard(images[image]));
      }
      return cards;
    }

    // TODO: implement build
    return Container(
      height: 350,
      child: ListView(
        children: buildImageCards(),
      ),
    );
  }

}