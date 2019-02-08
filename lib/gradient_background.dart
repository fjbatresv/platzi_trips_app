import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget{

  String title = "Popular";

  double height = 250.0;

  GradientBackground(this.title, this.height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: this.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF4268D3),
              Color(0xFF584CD1)
            ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),
      child: Text(
          this.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
          ),
      ),
      alignment: Alignment(-0.9, this.height == 400 ? -0.8 : -0.6),
    );
  }

}