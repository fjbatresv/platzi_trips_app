import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  final double marginLeft;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData icon;

  const CardImageWithFabIcon(
      {Key key,
      this.height = 350,
      this.width = 250,
      this.marginLeft = 20,
      this.pathImage = "assets/img/beach.jpeg",
      this.onPressedFabIcon,
      @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: this.height,
      width: this.width,
      margin: EdgeInsets.only(left: this.marginLeft),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          icon: this.icon,
          onTap: this.onPressedFabIcon,
        )
      ],
    );
  }
}
