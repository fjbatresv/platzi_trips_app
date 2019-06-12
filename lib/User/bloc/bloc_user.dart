import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {

  final AuthRepository _repository = AuthRepository();
  final CloudFirestoreRepository _firestoreRepository = CloudFirestoreRepository();

  //Flujo de datos - Stream
  //Stream - Firebase
  Stream<FirebaseUser>  streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

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

  @override
  void dispose() {
  }
}