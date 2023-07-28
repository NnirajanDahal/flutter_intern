import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'changeimagescreen.dart';

class ColorChangingButton extends StatefulWidget {
  const ColorChangingButton({super.key});

  @override
  State<ColorChangingButton> createState() => _ColorChangingButtonState();
}

class _ColorChangingButtonState extends State<ColorChangingButton> {
  Color textButtonColor = Colors.blue;
  Color elevatedButtonColor = Colors.grey;
  Color floatingActionButtonColor1 = Colors.green;
  Color floatingActionButtonColor2 = Colors.green;
  Color floatingActionButtonColor3 = Colors.green;

  void _changeTextButtonColor() {
    setState(() {
      final random = Random();
      textButtonColor = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void _changeElevatedButtonColor() {
    setState(() {
      final random = Random();
      elevatedButtonColor = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void _changeFloatingActionButtonColor1() {
    setState(() {
      final random = Random();
      floatingActionButtonColor1 = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void _changeFloatingActionButtonColor2() {
    setState(() {
      final random = Random();
      floatingActionButtonColor2 = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void _changeFloatingActionButtonColor3() {
    setState(() {
      final random = Random();
      floatingActionButtonColor3 = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  int counter = 0;
  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => ChangeIconAndImage()));
        //       },
        //       icon: const Icon(Icons.arrow_right_alt))
        // ],
        title: const Text("Day 1 Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              style: TextButton.styleFrom(foregroundColor: textButtonColor),
              onPressed: () {
                _changeTextButtonColor();
              },
              child: const Center(
                  child: Text(
                "Click to change property",
                style: TextStyle(fontSize: 30),
              ))),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: elevatedButtonColor),
            onPressed: () {
              _changeElevatedButtonColor();
            },
            child: const Text(
              "Click to change property",
            ),
          ),
          Text(
            counter.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _decrementCounter();
                  _changeFloatingActionButtonColor1();
                },
                backgroundColor: floatingActionButtonColor1,
                child: const Icon(Icons.arrow_downward),
              ),
              FloatingActionButton(
                onPressed: () {
                  _resetCounter();
                  _changeFloatingActionButtonColor2();
                },
                backgroundColor: floatingActionButtonColor2,
                child: const Icon(Icons.restore),
              ),
              FloatingActionButton(
                  onPressed: () {
                    _incrementCounter();
                    _changeFloatingActionButtonColor3();
                  },
                  backgroundColor: floatingActionButtonColor3,
                  child: const Icon(Icons.arrow_upward)),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const ChangeIconAndImage()),
                );
              },
              child: const Text("Next Page"))
        ],
      ),
    );
  }
}
