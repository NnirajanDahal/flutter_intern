import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern/day_2/screens/acolorchangingbutton.dart';
import 'package:flutter_intern/day_3/screens/ahorizontalimplementation.dart';
import 'package:flutter_intern/day_4/screens/appbarnavigation.dart';
import 'package:flutter_intern/day_4/screens/dropshadowcontainer.dart';

class Assessment4Screen extends StatefulWidget {
  const Assessment4Screen({super.key});

  @override
  State<Assessment4Screen> createState() => _Assessment4ScreenState();
}

class _Assessment4ScreenState extends State<Assessment4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom ScrollView"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const AppBarNavigation()));
              },
              icon: const Icon(Icons.arrow_right_alt))
        ],
      ),
      body: const DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: Colors.green,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Day 2',
                ),
                Tab(
                  text: 'Day 3',
                ),
                Tab(text: 'Day 4'),
              ],
            ),
            Divider(
              color: Colors.lightGreen,
              thickness: 15,
            ),
            Expanded(
              // Display the content of the selected tab
              child: TabBarView(
                children: [
                  ColorChangingButton(),
                  HorizontalImplementation(),
                  DropShadowContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
