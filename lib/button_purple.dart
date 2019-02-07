import 'package:flutter/material.dart';
import 'description_place.dart';

class ButtonPurple extends StatelessWidget {

  String text = "Navigate";

  ButtonPurple(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      child: InkWell(
        onTap: (){
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Navegando!"))
          );
        },
        child: Container(
          height: 50,
          width: 180,
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Lato",
                fontWeight: FontWeight.w900,
                fontSize: 18.0
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                colors: [
                  Color(0xFF4268D3),
                  Color(0xFF584CD1)
                ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp,
            )
          ),
        ),
      ),
    );
  }

}