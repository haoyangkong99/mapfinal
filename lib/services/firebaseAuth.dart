import 'package:finalexam/services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String getUID() {
    return _auth.currentUser!.uid;
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User? user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }
}
