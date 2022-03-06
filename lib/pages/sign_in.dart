import 'package:flutter/material.dart';
import 'sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  void _login(){

  }

  void _goToSignUp(){
    var smth = Navigator.of(context).overlay?.widget;
    print(smth);
    Navigator.of(context).pushReplacement(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const SignUpPage(),
            transitionDuration: const Duration(milliseconds: 500),
          fullscreenDialog: true
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
