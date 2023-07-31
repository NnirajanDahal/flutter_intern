import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  const WrapWidget({super.key});

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  bool floatingActionButtonPressed = false;

  List moretext = [
    "This is text 1",
    "This is text 2",
    "This is text 3",
    "This is text 4",
    "This is text 5",
    "This is text 6",
    "This is text 7",
    "This is text 8",
    "This is text 9",
    "This is text 10",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap widget display"),
      ),
      body: Wrap(
        children: moretext
            .map(
              (text) => Chip(
                label: FittedBox(
                  child: Row(
                    children: [
                      Text(text),
                      const Icon(Icons.apple),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              floatingActionButtonPressed =
                  floatingActionButtonPressed ? false : true;
            });
          },
          child: Icon(floatingActionButtonPressed
              ? Icons.arrow_downward
              : Icons.arrow_upward)),
    );
  }
}
