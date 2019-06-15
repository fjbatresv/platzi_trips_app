import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final bool mini;
  final IconData icon;
  final double iconSize;
  final Color color;
  final VoidCallback onTap;

  const CircleButton({Key key, this.mini, this.icon, this.iconSize, this.color, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }

}

class _CircleButton extends State<CircleButton> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
          backgroundColor: widget.color,
          mini: widget.mini,
          onPressed: widget.onTap,
          heroTag: null,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: Color(0xFF4268D3),
          ),
        )
    );
  }
}