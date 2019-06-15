import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {

  UserBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: _bloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            return showPlacesData(snapshot);
            break;
        }
      },
    );
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          GradientBack(height: 250),
          Text("Sesion no iniciada")
        ],
      );
    } else {
      User user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoUrl: snapshot.data.photoUrl
      );
      return Stack(
        children: <Widget>[
          GradientBack(height: 250),
          CardImageList(user: user)
        ],
      );
    }
  }

}