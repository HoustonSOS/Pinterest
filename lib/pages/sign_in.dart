import 'package:database/pages/logout.dart';
import 'package:database/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../service/shared_prefs.dart';
import '../service/utils.dart';
import 'sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  void _login(){
    String _email = email.text.trim();
    String _password = password.text.trim();

    if(email.text.isEmpty || password.text.isEmpty) return;

    AuthService.signInUser(context, _email, _password).then(
            (user){
              _getFirebaseUser(user);
            });
  }

  _getFirebaseUser(User? user) async {
    if(user != null){
      await Prefs.saveUserId(user.uid);
      Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (_,__,___) => const Logout()));
    }else{
        Utils.fireToast("Check your email or password");
    }
  }

  void _goToSignUp(){
    Navigator.of(context).pushReplacement(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const SignUpPage(),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                child: const Text("Sign in"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: _login,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Don't have an account?"),
                MaterialButton(
                    child: const Text("Sign up"),
                    onPressed: _goToSignUp,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
