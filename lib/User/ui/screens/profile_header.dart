import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {

  final User user;
  final title = Text(
    'Profile',
    style: TextStyle(
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0),
  );

  ProfileHeader({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title,
              ],
            ),
            UserInfo(user: user),
            ButtonsBar()
          ],
        ),
      );
  }
}
