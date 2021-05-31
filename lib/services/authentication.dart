import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_api.dart';

abstract class AuthenticationApi {
  final _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  String currentUserUid() {
    User? user = _firebaseAuth.currentUser;
    return user!.uid;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  Future<String> signWithEmailAndPassword(
      {required String email, required String password}) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  void senEmailVerification(){
    User? user = _firebaseAuth.currentUser;
    user!.sendEmailVerification();
  }

  bool isEmailVerified() {
    User? user = _firebaseAuth.currentUser;
    return user!.emailVerified;
  }
}
