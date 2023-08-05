import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cv_model.dart';

class DataViewScreen extends StatefulWidget {
  const DataViewScreen({super.key});

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  CVModel? cvData;

  @override
  void initState() {
    super.initState();
    _loadCVData();
  }

  void _loadCVData() async {
    final prefs = await SharedPreferences.getInstance();
    final cvDataString = prefs.getString('cvData');

    if (cvDataString != null && cvDataString.isNotEmpty) {
      Map<String?, dynamic>? cvDataMap;
      try {
        cvDataMap = jsonDecode(cvDataString);
      } catch (e) {
        print('Error decoding CV data: $e');
      }

      if (cvDataMap != null) {
        setState(() {
          cvData = CVModel.fromMap(cvDataMap!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Generated CV"),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Basic Information",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        const Text("Name :"),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(cvData!.firstName.toString()),
                        const SizedBox(
                          width: 5,
                        ),
                        //     Text(cvData!.middleName),
                        //     const SizedBox(
                        //       width: 5,
                        //     ),
                        //     Text(cvData!.lastName)
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Age :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.age),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Gender :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.gender),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Skills :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.skills),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Job Title :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.jobTitle),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Company Name :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.companyName),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Summary :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.summary),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Organisation Name :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.organisationName),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Achievements :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.achievements),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Project Title :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.projectTitle),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Description :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.description),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Organisation Name :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.organisationInvolvedName),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Languages :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.languages),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text("Intrest Areas :"),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(cvData!.intrestAreas),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
