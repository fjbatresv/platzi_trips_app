import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final int maxLine;

  const TextInput(
      {Key key,
      @required this.hintText,
      @required this.inputType,
      @required this.controller,
      this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: this.controller,
        keyboardType: this.inputType,
        maxLines: this.maxLine,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Lato',
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFE5E5E5),
          hintText: this.hintText,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE5E5E5)
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE5E5E5)
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          )
        ),
      ),
    );
  }
}
