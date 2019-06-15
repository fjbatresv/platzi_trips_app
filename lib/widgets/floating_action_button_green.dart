import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData icon;
  final VoidCallback onTap;

  const FloatingActionButtonGreen({Key key, this.icon = Icons.favorite_border, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}


class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      heroTag: null,
      onPressed: widget.onTap,
      child: Icon(
        widget.icon
      ),
    );
  }

}