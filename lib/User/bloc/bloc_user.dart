import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {

  final AuthRepository _repository = AuthRepository();
  final CloudFirestoreRepository _firestoreRepository = CloudFirestoreRepository();
  final FirebaseStorageRepository _storageRepository = FirebaseStorageRepository();
  final StreamController<Place> placeSelectedStreamController = StreamController<Place>();

  //Flujo de datos - Stream
  //Stream - Firebase
  Stream<FirebaseUser>  streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();
  Stream<QuerySnapshot> get placeListStream => _firestoreRepository.placeListStream();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink => placeSelectedStreamController.sink;


  Stream<QuerySnapshot> myPlacesListStream(String uid) => _firestoreRepository.myPlacesListStream(uid);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _firestoreRepository.buildPlaces(placesListSnapshot, user);

  //Casos de uso
  //1. SignIn a la aplicacion con Google
  Future<FirebaseUser> signIn() async {
    return _repository.signInFirebase();
  }

  //2. SignOut de la aplicacion
  signOut() {
    _repository.signOut();
  }

  //3. Registrar usuario en Firestore 
  void UpdateUserData(User user) => _firestoreRepository.updateUserDataFirestore(user);

  //4. Agregar un lugar
  Future<void> updatePlaceData(Place place) => _firestoreRepository.updatePlaceData(place);

  //5. Cargar imagen
  Future<StorageUploadTask> uploadFile(String path, File image) => _storageRepository.uploadFile(path, image);

  //6. Convertir places a ProfilePlaces
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _firestoreRepository.buildMyPlaces(placesListSnapshot);

  //7. Actualizar like
  Future likePlace(Place place, String uid) => _firestoreRepository.likePlace(place, uid);

  @override
  void dispose() {
  }
}