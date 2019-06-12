import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_places_list.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        GradientBack(title: null, height: (MediaQuery.of(context).size.height * 0.45),),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()
          ],
        ),
      ],
    );
  }

}