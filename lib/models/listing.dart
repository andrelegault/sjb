import 'dart:core';

/// Model that represents a job posting.
class Listing {
  String title;
  String location;
  String employer;
  String logo;
  String description;
  DateTime date;
  Map<String, dynamic> reqs;
  List<dynamic> resp;
  String url;

  Listing.fromJson(Map<String, dynamic> data):
        title = data['title'],
        location = data['location'],
        employer = data['employer'],
        date = DateTime.parse(data['listed_on']),
        logo = data['logo'],
        description = data['employer_description'],
        reqs = data['requirements'],
        resp = data['responsibilities'],
        url = data['link'];

  Listing(
      {this.title,
        this.location,
        this.employer,
        this.date,
        this.logo,
        this.description,
        this.reqs,
        this.resp,
        this.url});
}