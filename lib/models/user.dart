import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// User model represents a user signing up
class User extends ChangeNotifier {
  static List<User> users = [];
  String email;
  String name;
  String password;
  DateTime dob;
  String city;
  StudyField studyField;
  PositionStatus positionStatus;
  String term;

  static Future<List> loadJson() async =>
      json.decode(await rootBundle.loadString('assets/data/sample_users.json'));

  bool loginState = false;
  final List<bool> educationSelection = [true, false];
  final List<bool> statusSelection = [true, false];

  bool get isLoggedIn => loginState;

  User(
      {this.name = "John Doe",
      this.dob,
      this.city = "Montreal",
      this.studyField = StudyField.soen,
      this.positionStatus = PositionStatus.full_time,
      this.term});

  User.fromJson(Map<String, dynamic> data)
      : email = data['email'],
        password = data['password'],
        name = data['name'],
        dob = DateTime.parse(data['dob']),
        studyField = StudyField.values[data['studyField']],
        positionStatus = PositionStatus.values[data['positionStatus']];

  void clear() {
    email = null;
    name = null;
    password = null;
    dob = null;
    city = null;
    city = null;
    studyField = null;
    positionStatus = null;
    term = null;
    notifyListeners();
  }

  /// save the data to file
  void save() {
    var file = File('data/sample_users.json');
    String json = jsonEncode(this);
    file.writeAsString(json, mode: FileMode.append);
  }

  Map<String, dynamic> toJson() => {
        'email': this.email,
        'name': this.name,
        'password': 'test123',
        'dob': dob.toString(),
        'city': city,
        'field_of_study': this.studyField == StudyField.soen
            ? 'Software Engineering'
            : 'Finance',
        'position_status': this.positionStatus == PositionStatus.full_time
            ? 'full-time'
            : PositionStatus.part_time,
      };
}

enum StudyField {
  finance,
  soen,
}

enum PositionStatus {
  full_time,
  part_time,
}
