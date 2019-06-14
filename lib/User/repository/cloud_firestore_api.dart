import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/firebase_auth_api.dart';

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
    FirebaseUser user  = await _auth.currentUser();
    DocumentReference _userRef = _store.collection(this.USERS).document(user.uid);
    return _ref.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _userRef//reference
    });
  }
}
