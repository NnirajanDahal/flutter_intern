import 'package:flutter/material.dart';

import 'day_1/widgetlifecycle/widgetlifecycle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NumberWidget());
  }
}
