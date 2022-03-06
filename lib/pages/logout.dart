import 'package:flutter/material.dart';


class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log out"),
      ),
      body: const Center(
        child: MaterialButton(
          child: Text("Log out"),
          onPressed: null,
        ),
      ),
    );
  }
}
