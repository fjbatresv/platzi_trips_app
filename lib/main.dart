import 'package:flutter/material.dart';
import 'package:platzi_trips_app/description_place.dart';
import 'package:platzi_trips_app/review_list.dart';
import 'header_appbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  String nombre = "Javier";
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: Scaffold(

        body: Stack(
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
        )
      )
    );
  }
}
