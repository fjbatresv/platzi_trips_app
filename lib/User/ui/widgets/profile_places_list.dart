import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'profile_place.dart';


class ProfilePlacesList extends StatelessWidget {

  Place place = new Place(name: 'Knuckles Mountains Range', description: 'Hiking. Watter fall hunting. Natural bath', uriImage: 'https://images.pexels.com/photos/2150347/pexels-photo-2150347.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', likes: 3);
  Place place2 = new Place(name: 'Mountains', description: 'Hiking. Water fall hunting. Natural Bath.', likes: 10, uriImage: 'https://images.pexels.com/photos/210243/pexels-photo-210243.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }

}