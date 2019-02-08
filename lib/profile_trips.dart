import 'package:flutter/material.dart';
import 'gradient_background.dart';
import 'profile_info.dart';
import 'settings_icon.dart';
import 'profile_button_row.dart';
import 'profile_image_card_list.dart';

class ProfileTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBackground("Perfil", 400.0),
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 0,
            right: 10
          ),
          child: Column(
            children: <Widget>[
              SettingsIcon(),
              ProfileInfo(),
              Container(
                margin: EdgeInsets.only(
                  left: 20
                ),
                child: Column(
                  children: <Widget>[
                    ProfileButtonRow(),
                    ProfileImageCardList(5)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}