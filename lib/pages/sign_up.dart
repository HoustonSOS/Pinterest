import 'package:database/pages/sign_in.dart';
import 'package:flutter/material.dart';


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

  }

  void _goToSignIp(){
    var smth = Navigator.of(context).overlay;
    print(smth);
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const SignInPage(),
          transitionDuration: const Duration(milliseconds: 500),
          fullscreenDialog: true
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
                  onPressed: _goToSignIp,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
