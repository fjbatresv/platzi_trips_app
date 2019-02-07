import 'package:flutter/material.dart';
import 'image_card.dart';
import 'dart:math';

class ImageCardList extends StatelessWidget{

  final _random = new Random();
  final images = ["assets/img/paisaje1.jpg", "assets/img/paisaje2.jpg", "assets/img/paisaje3.jpg", "assets/img/paisaje4.jpg", "assets/img/paisaje5.jpg"];
  int quantity;

  ImageCardList(this.quantity);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> buildImageCards(){
      List<Widget> cards = [];
      for (int i = 0; i < this.quantity; i++){
        int image = 0 + _random.nextInt(images.length - 0);
        cards.add(ImageCard(images[image]));
      }
      return cards;
    }

    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: buildImageCards(),
      ),
    );
  }

}