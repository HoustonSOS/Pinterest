import 'package:database/pages/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pinterest',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

