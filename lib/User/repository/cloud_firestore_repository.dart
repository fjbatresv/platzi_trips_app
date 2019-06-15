import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final CloudFirestoreApi _api = CloudFirestoreApi();

  void updateUserDataFirestore(User user) => _api.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _api.updatePlaceData(place);
  Stream<QuerySnapshot> placeListStream() => _api.placeListStream();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _api.buildMyPlaces(placesListSnapshot);
  Stream<QuerySnapshot> myPlacesListStream(String uid) => _api.myPlacesListStream(uid);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _api.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String uid) => _api.likePlace(place, uid);
}