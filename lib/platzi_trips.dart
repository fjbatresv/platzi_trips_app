import 'package:flutter/material.dart';
import 'home_trips.dart';
import 'search_trips.dart';
import 'profile_trips.dart';

class PlatziTrips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips>{

  void onTapTapped(int index){
    setState(() {
      navIndex = index;
    });
  }

  int navIndex = 0;

  final List<Widget> content = [HomeTrips(), SearchTrips(), ProfileTrips()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: content[navIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, //Color del fondo
          primaryColor: Colors.purple //Color de los iconos
        ),
        child: BottomNavigationBar(
          currentIndex: navIndex,

          onTap: onTapTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("Search")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile")
            )
          ],
        ),
      ),
    );
  }

}