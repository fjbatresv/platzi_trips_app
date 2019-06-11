import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {

  final AuthRepository _repository = AuthRepository();

  //Flujo de datos - Stream
  //Stream - Firebase
  Stream<FirebaseUser>  streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos de uso
  //1. SignIn a la aplicacion con Google
  Future<FirebaseUser> signIn() async {
    return _repository.signInFirebase();
  }

  @override
  void dispose() {
  }
}