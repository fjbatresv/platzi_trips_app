import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtinGreen();
  }

}

class _FloatingActionButtinGreen extends State<FloatingActionButtonGreen>{

  IconData icon = Icons.favorite_border;

  void onPressedFav() {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Agregado a favoritos")));
    setState(() {
      if (icon == Icons.favorite_border) {
        icon = Icons.favorite;
      }else if (icon == Icons.favorite) {
        icon = Icons.favorite_border;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
        icon
      ),
    );
  }

}