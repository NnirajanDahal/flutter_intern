import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern/day_6/screens/data_entry_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cv_model.dart';

class DataViewScreen extends StatefulWidget {
  const DataViewScreen({super.key});

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  bool cvDeletePressed = false;
  // CVList? cvData;

  List<CVModel> cvData = [];

  Future<void> _loadCVData() async {
    setState(() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String prefData = pref.getString("cvData") ?? "";
      if (prefData.isNotEmpty || prefData != "") {
        List<CVModel> mapData = (json.decode(prefData) as List<dynamic>)
            .map((e) => CVModel.fromMap(e))
            .toList();
        if (mapData.isNotEmpty) {
          for (var i in mapData) {
            setState(() {
              cvData.add(i);
            });
          }
        }
      }
    });
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _loadCVData();
    });
  }

  @override
  void initState() {
    _loadCVData();
    super.initState();
  }

  Future<void> removeDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('cvData');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    removeDataFromSharedPreferences();
                  });
                },
                icon: const Icon(
                  Icons.delete,
                )),
            const SizedBox(
              width: 10,
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          title: const Text("Generated CV"),
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView.builder(
            // reverse: true,
            itemCount: cvData.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                    ),
                    margin: EdgeInsetsDirectional.symmetric(
                        vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 172, 190, 199),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "BASIC INFORMATION",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Name :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].firstName),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(cvData[index].middleName),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(cvData[index].lastName)
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Age :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].age),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Gender :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].gender),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Skills :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].skills),
                          ],
                        ),
                        const Text(
                          "WORK EXPERIENCE",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            const Text("Job Title :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].jobTitle),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Company Name :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].companyName),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Summary :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].summary),
                          ],
                        ),
                        const Text(
                          "EDUCATION",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            const Text("Organisation Name :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].organisationName),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Level :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].level),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Achievements :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].achievements),
                          ],
                        ),
                        const Text(
                          "OTHER PROJECTS",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            const Text("Project Title :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].projectTitle),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Description :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].description),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     const Text("Organisation Name :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData[index].organisationInvolvedName ?? ""),
                        //   ],
                        // ),
                        Row(
                          children: [
                            const Text("Languages :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].languages),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Intrest Areas :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(cvData[index].intrestAreas),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                  // : const Center(
                  //     child: Text("No Data"),
                  //   ),
                  );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const DataEntryScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
