import 'package:flutter/material.dart';
import 'package:flutter_intern/day_4/screens/assessment4screen.dart';
// import 'package:flutter_intern/day_4/screens/assessment4screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assessment4Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
