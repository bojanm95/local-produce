import 'package:domace_front/view/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
        primarySwatch: Colors.green,
        ),
        home: LandingPage(),
      );
    }
}