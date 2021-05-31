abstract class Authentication{
  getFirebaseAUth();
  Future<String> currentUserid();
  late Future<void> signOut;
  Future<String> signInWithEmailAndPassword({String email, String password});
  Future<String> createUserWithEmailAndPassword({String email, String password});
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
  
}