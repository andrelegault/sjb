import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sjb/screens/singlePosting/page_section.dart';
import '../../models/posting.dart';

class SingleListingScreen extends StatelessWidget {
  static const routeName = 'single-post';

  Posting posting;
  SingleListingScreen(Posting posting){this.posting = posting;}

  @override
  Widget build(BuildContext context) {
    PageSection titleSection = PageSection(title: posting.title, description: posting.location);
    PageSection descriptionSection = PageSection(title: 'Job Description', description: posting.description);
    PageSection requirementSection = PageSection(title: 'Minimal Requirements', description: posting.description);
    PageSection preferredSection = PageSection(title: 'Preferred Qualifications', description: posting.description);

    return Scaffold(
        appBar: AppBar(title: Text(posting.employer),),
        body: SingleChildScrollView(
          child:
            Column(
            children: [
              titleSection,
              descriptionSection,
              requirementSection,
              preferredSection,
            ]
          )
        )
    );
  }
}
