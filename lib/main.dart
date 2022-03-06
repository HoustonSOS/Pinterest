import 'package:database/pages/sign_in.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hey Lord',
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

