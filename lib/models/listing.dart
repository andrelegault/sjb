import 'dart:core';

import 'user.dart';

/// Model that represents a job posting.
class Listing {
  String title;
  String location;
  String employer;
  String logo;
  String description;
  DateTime date;
  Map<String, dynamic> reqs;
  PositionStatus positionStatus;
  StudyField studyField;
  List<dynamic> resp;
  String url;

  Listing.fromJson(Map<String, dynamic> data)
      : title = data['title'],
        location = data['city'],
        employer = data['employer'],
        date = DateTime.parse(data['listed_on']),
        logo = data['logo'],
        studyField = data['field_of_study'] == 'Software Engineering'
            ? StudyField.soen
            : StudyField.finance,
        positionStatus = data['position_status'] == 'full-time'
            ? PositionStatus.full_time
            : PositionStatus.part_time,
        description = data['employer_description'],
        reqs = data['requirements'],
        resp = data['responsibilities'],
        url = data['link'];

  Listing(
      {this.title,
      this.location,
      this.employer,
      this.date,
      this.studyField,
      this.logo,
      this.description,
      this.reqs,
      this.resp,
      this.url});
}
