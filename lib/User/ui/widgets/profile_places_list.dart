import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  UserBloc _bloc;
  final User user;

  ProfilePlacesList({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
        stream: _bloc.myPlacesListStream(user.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              return Column(
                children: _bloc.buildMyPlaces(snapshot.data.documents),
              );
              break;
          }
        },
      ),
    );
  }
}
