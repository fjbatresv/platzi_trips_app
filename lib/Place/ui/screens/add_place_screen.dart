import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/text_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;

  const AddPlaceScreen({Key key, this.image}) : super(key: key);

  @override
  _AddPlaceScreen createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  UserBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(title: "", height: 300),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, left: 5),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20, right: 10, top: 45),
                  child: TitleHeader(title: "Add a new place"),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    icon: Icons.camera_alt,
                    width: 350,
                    height: 250,
                    marginLeft: 0,
                  ),
                ),
                Container(
                  //Textfield Title
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLine: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLine: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextInputLocation(
                    hintText: "Add Location",
                    icon: Icons.location_on,
                  ),
                ),
                Container(
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onTap: () async {
                      final user = await _bloc.currentUser;
                      if (user == null) return null;
                      final uploadTask = await _bloc.uploadFile(
                          'places/${user.uid}/${DateTime.now().toIso8601String()}',
                          widget.image);
                      final uploadResult = await uploadTask.onComplete;
                      final downloadUrl =
                          await uploadResult.ref.getDownloadURL();
                      _bloc
                          .updatePlaceData(Place(
                              name: _controllerTitlePlace.text,
                              description: _controllerDescriptionPlace.text,
                              uriImage: downloadUrl,
                              likes: 0), )
                          .whenComplete(() {
                        print('Cargado!');
                        Navigator.pop(context);
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
