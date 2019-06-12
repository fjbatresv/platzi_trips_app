import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  UserBloc _bloc;
  User _user;
  final title = Text(
    'Profile',
    style: TextStyle(
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0),
  );

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: _bloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            return _showProfileData(snapshot);
            break;
        }
      },
    );

    // return Container(
    //   margin: EdgeInsets.only(
    //       left: 20.0,
    //       right: 20.0,
    //       top: 50.0
    //   ),
    //   child: Column(
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           title
    //         ],
    //       ),
    //       UserInfo('assets/img/ann.jpg', 'Anahí Salgado','anahi@platzi.com'),
    //       ButtonsBar()
    //     ],
    //   ),
    // );
  }

  Widget _showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print('Sin sesion');
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("Parece que nos has iniciado sesion.")],
        ),
      );
    } else {
      print('Con sesion');
      print('Snapshot ${snapshot.data}');
      _user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoUrl: snapshot.data.photoUrl);
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title,
              ],
            ),
            UserInfo(user: _user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
