import 'package:flutter/material.dart';
import 'description_place.dart';
import 'review_list.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace(
                "Duwili Ella",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id justo lacinia, convallis ipsum sed, tempus leo. Praesent ante elit, lobortis sed faucibus vitae, vulputate a diam.",
                2),
            ReviewList(4)
          ],
        ),
        HeaderAppBar()
      ],
    );
  }

}