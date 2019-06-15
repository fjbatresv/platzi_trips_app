import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;

  const TextInputLocation({Key key, this.hintText, this.controller, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: this.controller,
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.blueGrey,
            fontSize: 15,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: this.hintText,
            suffixIcon: Icon(this.icon),
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
      ),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15,
          offset: Offset(0, 7),
        )
      ]),
    );
  }
}
