import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'card_image.dart';

class CardImageList extends StatefulWidget {
  final User user;

  const CardImageList({Key key, this.user}) : super(key: key);

  @override
  _CardImageList createState() {
    return _CardImageList();
  }
}

class _CardImageList extends State<CardImageList> {
  UserBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<UserBloc>(context);
    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: _bloc.placeListStream,
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
              return listVIewPlace(
                  _bloc.buildPlaces(snapshot.data.documents, widget.user));
              break;
          }
        },
      ),
    );
  }

  Widget listVIewPlace(List<Place> places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        _bloc.likePlace(place, widget.user.uid);
        place.likes = place.liked ? place.likes + 1 : place.likes - 1;
        _bloc.placeSelectedSink.add(place);
      });
    }

    return ListView(
      padding: EdgeInsets.all(29),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return GestureDetector(
          onTap: () => _bloc.placeSelectedSink.add(place),
          child: CardImageWithFabIcon(
            pathImage: place.uriImage,
            icon: place.liked ? Icons.favorite : Icons.favorite_border,
            onPressedFabIcon: () {
              setLiked(place);
            },
            internet: true,
          ),
        );
      }).toList(),
    );
  }
}
