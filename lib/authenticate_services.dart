import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruhack/database_services.dart';

class AuthenticateSerivice {
  final _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future signUp(String first, String last, int phone,String email, String password, int age, String gender) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      DatabaseService db = DatabaseService();
      await db.addUserData(result.user.uid,first, last, phone, email, age, gender);
      await db.addMedicalRecord(result.user.uid,"test", "test", ["test","test","test"]);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logOut() async {
    return await _auth.signOut();
  }
}
