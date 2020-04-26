import 'package:flutter/material.dart';

/// User model represents a user signing up
class User extends ChangeNotifier {
  String email;
  String name;
  String password;
  DateTime dob;
  String city;
  StudyField studyField;
  PositionStatus positionStatus;
  String term;

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
        dob = data['dob'],
        studyField = StudyField.values[data['studyField']],
        positionStatus = PositionStatus.values[data['positionStatus']];
}

enum StudyField {
  finance,
  soen,
}

enum PositionStatus {
  full_time,
  part_time,
}
