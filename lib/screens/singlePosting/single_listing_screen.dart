import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sjb/screens/singlePosting/page_section.dart';
import '../../models/listing.dart';
import 'package:sjb/screens/singlePosting/buttons_section.dart';

class SingleListingScreen extends StatelessWidget {
  static const routeName = 'single-post';

  Posting posting;
  SingleListingScreen(Posting posting){this.posting = posting;}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text(posting.employer),),
        body:
          SingleChildScrollView(
            child:
              Column(
              children: [
                ButtonSection(color: Colors.black),
                PageSection(title: posting.title, description: posting.location),
                PageSection(title: 'Job Description', description: posting.description),
                PageSection(title: 'Minimal Requirements', description: posting.description),
                PageSection(title: 'Preferred Qualifications', description: posting.description)
              ]
            )
          )

    );
  }
}
