import 'package:database/pages/sign_in.dart';
import 'package:database/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service/shared_prefs.dart';
import '../service/utils.dart';
import 'logout.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  void _createUser(){
    final _email = email.text.trim();
    final _password = password.text.trim();
    final _name = name.text.trim();

    if(email.text.isEmpty || password.text.isEmpty) return;

    AuthService.signUpUser(context, _email, _password).then(
        (user){
          _getFireBaseUser(user);
        });
  }

  void _getFireBaseUser(User? user) async {
    if(user != null){
      await Prefs.saveUserId(user.uid);
      Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (_,__,___) => const Logout()));
    }else{
      Utils.fireToast("Check your information");
    }
  }

  void _goToSignIn(){
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const SignInPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                  hintText: "Full Name",
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              minWidth: 500,
              height: 50,
              child: const Text("Sign up"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _createUser,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Already have an account?"),
                MaterialButton(
                  child: const Text("Sign in"),
                  onPressed: _goToSignIn,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
