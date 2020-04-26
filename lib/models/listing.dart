import 'dart:core';

/// Model that represents a job posting.
class Listing {
  String title;
  String location;
  String employer;
  String term;
  String logo;
  String description;
  Map<String, dynamic> reqs;
  List<dynamic> resp;
  String url;

  Listing.fromJson(Map<String, dynamic> data):
        title = data['title'],
        location = data['location'],
        employer = data['employer'],
        term = data['term'],
        logo = data['logo'],
        description = data['employer_description'],
        reqs = data['requirements'],
        resp = data['responsibilities'],
        url = data['link'];

  Listing(
      {this.title,
        this.location,
        this.employer,
        this.term,
        this.logo,
        this.description,
        this.reqs,
        this.resp,
        this.url});
}