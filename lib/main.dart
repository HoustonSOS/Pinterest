import 'package:database/pages/home.dart';
import 'package:database/pages/pinterest.dart';
import 'package:database/pages/profile.dart';
import 'package:database/pages/search.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        'search_page' :  (context) => const SearchPage(),
      },
    );
  }
}

