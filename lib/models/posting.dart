import 'dart:core';

/// Model that represents a job posting.
class Posting {
  final String title;
  final String location;
  final String employer;
  final String term;
  final String logo;
  final String description;
//  final Map<String, List<String>> reqs;
//  final List<String> resp;
  final String url;

  Posting(
      {this.title,
        this.location,
        this.employer,
        this.term,
        this.logo,
        this.description,
//        this.reqs,
//        this.resp,
        this.url});
}