import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onTap;

  const ButtonGreen(
      {Key key,
      @required this.text,
      @required this.onTap,
      this.height,
      this.width})
      : super(key: key);
  @override
  _ButtonGreen createState() {
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              colors: [Color(0xFFA7FF84), Color(0xFF1CBB78)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
