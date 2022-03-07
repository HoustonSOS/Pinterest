import 'package:database/service/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../pages/sign_in.dart';
class AuthService{
  static final _auth = FirebaseAuth.instance;

  static Future<User?> signInUser(
      BuildContext context, String email, String password) async {
    try{
      _auth.signInWithEmailAndPassword(email: email, password: password);
      var user = _auth.currentUser;
      print(user.toString());
      return user;
    } catch(e){
      print(e);
    }
    return null;
  }

  static Future<User?> signUpUser(
      BuildContext context, String email, String password) async {
    try{
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var user = result.user;
      print(user.toString());
      return user;
    } catch(e){
      print(e);
    }
    return null;
  }

  static void signOutUser(BuildContext context) async {
    _auth.signOut();
    Prefs.removeUserId().then((value){
      Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (_,__,___){return const SignInPage();}));
    });
  }

}