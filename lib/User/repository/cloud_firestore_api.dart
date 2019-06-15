import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/firebase_auth_api.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreApi {
  final String USERS = 'users';
  final String PLACES = 'places';

  final Firestore _store = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference _ref = _store.collection(this.USERS).document(user.uid);
    return _ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference _ref = _store.collection(this.PLACES);
    FirebaseUser user = await _auth.currentUser();
    DocumentReference _userRef =
        _store.collection(this.USERS).document(user.uid);
    await _ref.add({
      'name': place.name,
      'uriImage': place.uriImage,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _userRef //reference
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        _userRef.updateData({
          'myPlaces': FieldValue.arrayUnion(
              [_store.document("${this.PLACES}/${snapshot.documentID}")])
        });
      });
    });
  }

  Stream<QuerySnapshot> placeListStream() {
    return _store.collection(this.PLACES).snapshots();
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = <ProfilePlace>[];
    return profilePlaces =
        placesListSnapshot.map<ProfilePlace>((placeSnapshot) {
      return ProfilePlace(Place(
        name: placeSnapshot.data['name'],
        description: placeSnapshot.data['description'],
        uriImage: placeSnapshot.data['uriImage'],
        likes: placeSnapshot.data['likes'],
      ));
    }).toList();
  }

  Stream<QuerySnapshot> myPlacesListStream(String uid) {
    DocumentReference _userRef = _store.collection(this.USERS).document(uid);
    return _store
        .collection(this.PLACES)
        .where('userOwner', isEqualTo: _userRef)
        .snapshots();
  }

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, User user) {
    return placesListSnapshot.map<Place>((placeSnapshot) {
      Place place = Place(
          id: placeSnapshot.documentID,
          name: placeSnapshot.data['name'],
          description: placeSnapshot.data['description'],
          uriImage: placeSnapshot.data['uriImage'],
          likes: placeSnapshot.data['likes']);
      List usersLikedRefs = placeSnapshot.data['usersLiked'];
      place.liked = false;
      usersLikedRefs?.forEach((ref) {
        if (user.uid == ref.documentID) {
          place.liked = true;
        }
      });
      return place;
    }).toList();
  }

  Future likePlace(Place place, String uid) async {
    _store.runTransaction((transaction) async {
      DocumentSnapshot placeDS =
          await _store.collection(this.PLACES).document(place.id).get();
      await transaction.update(placeDS.reference, {
        "likes": !place.liked ? placeDS['likes'] - 1 : placeDS['likes'] + 1,
        'usersLiked': !place.liked
            ? FieldValue.arrayRemove([_store.document('${this.PLACES}/${uid}')])
            : FieldValue.arrayUnion([_store.document('${this.PLACES}/${uid}')])
      });
    });
  }
}
