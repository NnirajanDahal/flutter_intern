import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intern/day_6/screens/dummyscreen.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

TextEditingController intrestAreasController = TextEditingController();
TextEditingController languageController = TextEditingController();
TextEditingController skillsController = TextEditingController();
TextEditingController jobTitleController = TextEditingController();
TextEditingController companyNameController = TextEditingController();
TextEditingController projectTitleController = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _DataEntryScreenState extends State<DataEntryScreen> {
  bool switchValue = true;
  bool otherProjectsChanged = true;
  bool involvedInOrganisation = false;
  bool addSkillPressed = false;
  // bool addJobTitlePressed = false;
  bool addCompanyNamePressed = false;
  bool addLanguagePressed = false;
  bool addProjectTitlePressed = false;
  bool addIntrestAreaPressed = false;
  List<String> educationLevel = ["SEE", "+2", "Bachelor", "Master", "Phd"];
  List<String> languages = [];
  List<String> intrestAreas = [];
  List<String> skills = [];
  List<String> jobTitle = [];
  List<String> companyName = [];
  List<String> projectTitle = [];
  String? selectedLevel;
  String? selectedGender;
  String? selectedOrganisation;

  DateTime experienceSelectedStartDate = DateTime.now();
  DateTime experienceSelectedEndDate = DateTime.now();
  DateTime educationSelectedStartDate = DateTime.now();
  DateTime educationSelectedEndDate = DateTime.now();
  DateTime otherProjectsSelectedStartDate = DateTime.now();
  DateTime otherProjectsSelectedEndDate = DateTime.now();

  Future<void> _selectExperienceStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: experienceSelectedStartDate,
      firstDate: DateTime(2000),
      lastDate: experienceSelectedStartDate,
    );
    if (picked != null && picked != experienceSelectedStartDate) {
      setState(() {
        experienceSelectedStartDate = picked;
      });
    }
  }

  Future<void> _selectExperienceEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: experienceSelectedEndDate,
      firstDate: DateTime(2000),
      lastDate: experienceSelectedEndDate,
    );
    if (picked != null && picked != experienceSelectedEndDate) {
      setState(() {
        experienceSelectedEndDate = picked;
      });
    }
  }

  Future<void> _selectEducationStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: educationSelectedStartDate,
      firstDate: DateTime(2000),
      lastDate: educationSelectedStartDate,
    );
    if (picked != null && picked != educationSelectedStartDate) {
      setState(() {
        educationSelectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEducationEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: educationSelectedEndDate,
      firstDate: DateTime(2000),
      lastDate: educationSelectedEndDate,
    );
    if (picked != null && picked != educationSelectedEndDate) {
      setState(() {
        educationSelectedEndDate = picked;
      });
    }
  }

  Future<void> _selectOtherProjectsStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: otherProjectsSelectedStartDate,
      firstDate: DateTime(2000),
      lastDate: otherProjectsSelectedStartDate,
    );
    if (picked != null && picked != otherProjectsSelectedStartDate) {
      setState(() {
        otherProjectsSelectedStartDate = picked;
      });
    }
  }

  Future<void> _selectOtherProjectsEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: otherProjectsSelectedEndDate,
      firstDate: DateTime(2000),
      lastDate: otherProjectsSelectedEndDate,
    );
    if (picked != null && picked != otherProjectsSelectedEndDate) {
      setState(() {
        otherProjectsSelectedEndDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 175, 185),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 62, 73),
        centerTitle: true,
        title: const Text("Generate CV"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12, vertical: 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 368,
                  color: Colors.blueGrey,
                  child: const Center(
                    child: Text(
                      "Basic Info",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length > 10) {
                            return "Not >10 char";
                          } else if (value.isEmpty) {
                            setState(() {});
                            return "Required";
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"^[a-zA-Z]+$")),
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "First Name",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length > 10) {
                            return "Not >10 char";
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"^[a-zA-Z]+$")),
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Middle Name",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length > 10) {
                            return "Not >10 char";
                          } else if (value.isEmpty) {
                            return "Required";
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"^[a-zA-Z]+$")),
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Last Name",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length > 2) {
                            return "Invalid Age";
                          } else if (value.isEmpty) {
                            return "Required";
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          labelText: "Age",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text("Gender :"),
                    Radio(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        }),
                    const Text("Male"),
                    Radio(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        }),
                    const Text("Female"),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length > 10) {
                      return "Not >10 char";
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z]+$")),
                  ],
                  controller: skillsController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            addSkillPressed = true;
                            skills.add(skillsController.text);
                            skillsController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                    labelText: "Skills",
                  ),
                ),
                addSkillPressed
                    ? SizedBox(
                        height: 50,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: skills.length,
                            itemBuilder: (context, index) {
                              return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: <Widget>[
                                    Chip(
                                      label: Text(
                                        skills[index],
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 15),
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          skills.removeAt(index);
                                          if (skills.isEmpty) {
                                            addSkillPressed = false;
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(),
                                  ]);
                            },
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                Container(
                  width: 368,
                  color: Colors.blueGrey,
                  child: const Center(
                    child: Text(
                      "Work Experience",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length > 10) {
                      return "Not >10 char";
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z]+$")),
                  ],
                  controller: jobTitleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // suffixIcon: IconButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         addJobTitlePressed = true;
                    //         jobTitle.add(jobTitleController.text);
                    //         jobTitleController.clear();
                    //       });
                    //     },
                    //     icon: const Icon(
                    //       Icons.add,
                    //       color: Colors.black,
                    //     )),
                    labelText: "Job Title",
                  ),
                ),
                // addJobTitlePressed
                //     ? SizedBox(
                //         height: 50,
                //         child: Expanded(
                //           child: ListView.builder(
                //             scrollDirection: Axis.horizontal,
                //             itemCount: jobTitle.length,
                //             itemBuilder: (context, index) {
                //               return Wrap(
                //                   spacing: 8.0,
                //                   runSpacing: 4.0,
                //                   children: <Widget>[
                //                     Chip(
                //                       label: Text(jobTitle[index]),
                //                       onDeleted: () {
                //                         setState(() {
                //                           jobTitle.removeAt(index);
                //                           if (jobTitle.isEmpty) {
                //                             addJobTitlePressed = false;
                //                           }
                //                         });
                //                       },
                //                     ),
                //                     const SizedBox(),
                //                   ]);
                //             },
                //           ),
                //         ),
                //       )
                //     :
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length > 10) {
                      return "Not >10 char";
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z]+$")),
                  ],
                  controller: companyNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            addCompanyNamePressed = true;
                            jobTitle.add(jobTitleController.text);
                            companyName.add(companyNameController.text);
                            jobTitleController.clear();
                            companyNameController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                    labelText: "Company Name",
                  ),
                ),
                addCompanyNamePressed
                    ? const SizedBox(
                        height: 10,
                      )
                    : const SizedBox(),
                addCompanyNamePressed
                    ? SizedBox(
                        height: 70,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: companyName.length,
                            itemBuilder: (context, index) {
                              return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: <Widget>[
                                    Chip(
                                      label: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text("Job Title:"),
                                              const SizedBox(width: 5),
                                              Text(
                                                jobTitle[index],
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("C. Name:"),
                                              const SizedBox(width: 5),
                                              Text(
                                                companyName[index],
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          jobTitle.removeAt(index);
                                          companyName.removeAt(index);
                                          if (companyName.isEmpty) {
                                            addCompanyNamePressed = false;
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(),
                                  ]);
                            },
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                TextFormField(
                  validator: (value) {
                    if (value!.length > 100) {
                      return "Not >100 char";
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z]+$")),
                  ],
                  maxLines: null,
                  decoration: const InputDecoration(
                      labelText: "Summary", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("Start Date :"),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("${experienceSelectedStartDate.toLocal()}"
                            .split(' ')[0]),
                        IconButton(
                            onPressed: () {
                              _selectExperienceStartDate(context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("End Date :"),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("${experienceSelectedEndDate.toLocal()}"
                            .split(' ')[0]),
                        IconButton(
                            onPressed: () {
                              _selectExperienceEndDate(context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 368,
                  color: Colors.blueGrey,
                  child: const Center(
                    child: Text(
                      "Education",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.length > 10) {
                      return "Not >10 char";
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z]+$")),
                  ],
                  decoration: const InputDecoration(
                      labelText: "Organisation Name",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text("Level : "),
                    const SizedBox(
                      width: 5,
                    ),
                    DropdownButton(
                      hint: const Text('Select'), // Not necessary for Option 1
                      value: selectedLevel,
                      onChanged: (newValue) {
                        setState(() {
                          selectedLevel = newValue;
                        });
                      },
                      items: educationLevel.map((location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("Start Date :"),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("${educationSelectedStartDate.toLocal()}"
                            .split(' ')[0]),
                        IconButton(
                            onPressed: () {
                              _selectEducationStartDate(context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("End Date :"),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("${educationSelectedEndDate.toLocal()}"
                            .split(' ')[0]),
                        IconButton(
                            onPressed: () {
                              _selectEducationEndDate(context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length > 50) {
                      return "Not >50 char";
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z]+$")),
                  ],
                  maxLines: null,
                  decoration: const InputDecoration(
                      labelText: "Achievements", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 368,
                  color: Colors.blueGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Other Projects",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CupertinoSwitch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            otherProjectsChanged =
                                otherProjectsChanged ? false : true;
                            switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                otherProjectsChanged
                    ? Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.length > 10) {
                                return "Not >10 char";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"^[a-zA-Z]+$")),
                            ],
                            controller: projectTitleController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addProjectTitlePressed = true;
                                      projectTitle
                                          .add(projectTitleController.text);
                                      projectTitleController.clear();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  )),
                              labelText: "Project Title",
                            ),
                          ),
                          addProjectTitlePressed
                              ? SizedBox(
                                  height: 50,
                                  child: Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: projectTitle.length,
                                      itemBuilder: (context, index) {
                                        return Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: <Widget>[
                                              Chip(
                                                label: Text(
                                                  projectTitle[index],
                                                  style: const TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15),
                                                ),
                                                onDeleted: () {
                                                  setState(() {
                                                    projectTitle
                                                        .removeAt(index);
                                                    if (projectTitle.isEmpty) {
                                                      addProjectTitlePressed =
                                                          false;
                                                    }
                                                  });
                                                },
                                              ),
                                              const SizedBox(),
                                            ]);
                                      },
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Start Date :"),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      "${otherProjectsSelectedStartDate.toLocal()}"
                                          .split(' ')[0]),
                                  IconButton(
                                      onPressed: () {
                                        _selectOtherProjectsStartDate(context);
                                      },
                                      icon: const Icon(Icons.calendar_month)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("End Date :"),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      "${otherProjectsSelectedEndDate.toLocal()}"
                                          .split(' ')[0]),
                                  IconButton(
                                      onPressed: () {
                                        _selectOtherProjectsEndDate(context);
                                      },
                                      icon: const Icon(Icons.calendar_month)),
                                ],
                              )
                            ],
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.length > 100) {
                                return "Not >100 char";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"^[a-zA-Z]+$")),
                            ],
                            maxLines: null,
                            decoration: const InputDecoration(
                                labelText: "Description",
                                border: OutlineInputBorder()),
                          ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      involvedInOrganisation
                          ? const SizedBox()
                          : const Text(
                              ' Involved in any organisation :',
                              style: TextStyle(fontSize: 16),
                            ),
                      Radio(
                          value: 'Yes',
                          groupValue: selectedOrganisation,
                          onChanged: (value) {
                            setState(() {
                              selectedOrganisation = value;
                              involvedInOrganisation = true;
                            });
                          }),
                      const Text("Yes"),
                      Radio(
                          value: 'No',
                          groupValue: selectedOrganisation,
                          onChanged: (value) {
                            setState(() {
                              selectedOrganisation = value;
                              involvedInOrganisation = false;
                            });
                          }),
                      const Text('No'),
                      const SizedBox(width: 5),
                      involvedInOrganisation
                          ? Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length > 10) {
                                    return "Not >10 char";
                                  } else if (value.isEmpty) {
                                    return "Required";
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r"^[a-zA-Z]+$")),
                                ],
                                decoration: const InputDecoration(
                                    labelText: "Organisation Name",
                                    border: OutlineInputBorder()),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: languageController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            addLanguagePressed = true;
                            languages.add(languageController.text);
                            languageController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                    labelText: "Languages",
                  ),
                ),
                addLanguagePressed
                    ? SizedBox(
                        height: 50,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: languages.length,
                            itemBuilder: (context, index) {
                              return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: <Widget>[
                                    Chip(
                                      label: Text(
                                        languages[index],
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 15),
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          languages.removeAt(index);
                                          if (languages.isEmpty) {
                                            addLanguagePressed = false;
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(),
                                  ]);
                            },
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                TextFormField(
                  controller: intrestAreasController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            addIntrestAreaPressed = true;
                            intrestAreas.add(intrestAreasController.text);
                            intrestAreasController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                    labelText: "Intrest Areas",
                  ),
                ),
                addIntrestAreaPressed
                    ? SizedBox(
                        height: 50,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: intrestAreas.length,
                            itemBuilder: (context, index) {
                              return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: <Widget>[
                                    Chip(
                                      label: Text(
                                        intrestAreas[index],
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 15),
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          intrestAreas.removeAt(index);
                                          if (intrestAreas.isEmpty) {
                                            addIntrestAreaPressed = false;
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(),
                                  ]);
                            },
                          ),
                        ),
                      )
                    : const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text("Confirmation?"),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      _formKey.currentState!.reset();
                                      Navigator.pop(context);
                                      // Navigator.push(
                                      //     context,
                                      //     CupertinoPageRoute(
                                      //         builder: (context) =>
                                      //             const DummyScreen()));
                                    },
                                    child: const Text("Yes"),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("NO"),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      });
                    }
                  },
                  child: const Text("Save"),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
