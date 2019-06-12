import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class CloudFirestoreApi {
  final String USERS = 'users';
  final String PLACES = 'places';

  final Firestore _store = Firestore.instance;

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
}
