import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    FirebaseUser _user;
    GoogleSignInAccount _gAccount = await _googleSignIn.signIn();
    if (_gAccount != null) {
      GoogleSignInAuthentication _gAuth = await _gAccount.authentication;
      _user = await _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: _gAuth.idToken, accessToken: _gAuth.accessToken));
    }
    return _user;
  }
}
