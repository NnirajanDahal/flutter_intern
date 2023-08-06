import 'package:flutter/material.dart';
import 'package:flutter_intern/day_4/screens/assessment4screen.dart';
import 'package:flutter_intern/day_6/screens/data_entry_screen.dart';
import 'package:flutter_intern/day_6/screens/data_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_intern/day_4/screens/assessment4screen.dart';
// class SharedPrefsService {
//   SharedPreferences? sharedPreferences;
//   Future<void> init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPrefsService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const DataViewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
