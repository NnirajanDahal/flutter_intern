// class CVList {
//   List<CVModel>? cvList;
//   CVList({
//     this.cvList,
//   });

//   CVList.fromMap(Map<String?, dynamic> map) {
//     if (map['data']) {
//       cvList = <CVModel>[];
//       map['data'].forEach((v) {
//         cvList!.add(CVModel.fromMap(v));
//       });
//     }
//   }

//   Map<String, dynamic> toMap() {
//     final map = <String, dynamic>{};

//     if (cvList != null) {
//       map['data'] = cvList!.map((e) => e.toMap()).toList();
//     }

//     return map;
//   }
// }

class CVModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String age;
  final String gender;
  final String skills;
  final String jobTitle;
  final String companyName;
  final String summary;
  final String organisationName;
  final String level;
  final String achievements;
  final String projectTitle;
  final String description;
  final String organisationInvolvedName;
  final String languages;
  final String intrestAreas;

  CVModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.skills,
    required this.jobTitle,
    required this.companyName,
    required this.summary,
    required this.organisationName,
    required this.level,
    required this.achievements,
    required this.projectTitle,
    required this.description,
    required this.organisationInvolvedName,
    required this.languages,
    required this.intrestAreas,
  });

  // Convert CV data to a Map
  Map<String?, dynamic> toMap() {
    return {
      'firstname': firstName,
      'middlename': middleName,
      'lastname': lastName,
      'age': age,
      'gender': gender,
      'skill': skills,
      'jobtitle': jobTitle,
      'companyname': companyName,
      'summary': summary,
      'organisationname': organisationName,
      'level': level,
      'achievements': achievements,
      'projecttitle': projectTitle,
      'description': description,
      'organisationinvolvedname': organisationInvolvedName,
      'language': languages,
      'intrestarea': intrestAreas,
    };
  }

  // Create a CVModel instance from a Map
  factory CVModel.fromMap(Map<String?, dynamic> map) {
    return CVModel(
      firstName: map['firstname'],
      middleName: map['middlename'],
      lastName: map['lastname'],
      age: map['age'],
      gender: map['gender'],
      skills: map['skill'],
      jobTitle: map['jobtitle'],
      companyName: map['companyname'],
      summary: map['summary'],
      organisationName: map['organisationname'],
      level: map['level'],
      achievements: map['achievements'],
      projectTitle: map['projecttitle'],
      description: map['description'],
      organisationInvolvedName: map['organisationinvolvedname'],
      languages: map['language'],
      intrestAreas: map['intrestarea'],
    );
  }
}
