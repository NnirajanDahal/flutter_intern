import 'package:flutter/material.dart';
import 'package:flutter_intern/day_3/screens/horizontalimplementation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HorizontalImplementation());
  }
}
