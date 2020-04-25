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


    String min_requirements=_group(posting.reqs, 'minimal');
    String pref_requirements =_group(posting.reqs, 'preferred');

    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Confirmed"),
            content: new Text("You have applied to this job!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(

          title: Text(posting.employer),),
        body:
          SingleChildScrollView(
            child:
              Column(
              children: [
//                ButtonSection(color: Colors.black),
                PageSection(title: 'Position', description: posting.title),
                PageSection(title: "Job Location", description: posting.location),
                PageSection(title: "Term", description: posting.term),
                PageSection(title: 'Company Description', description: posting.description),
                PageSection(title: 'Responsabilities', description: posting.resp[0]),
                PageSection(title: 'Minimal Requirements', description: min_requirements ),
                PageSection(title: 'Preferred Qualifications', description: pref_requirements),
//                PageSection(title: 'Link', description: posting.url),
              ]
            )
          ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: FloatingActionButton(
            onPressed: () => _showDialog(),
            tooltip: 'Increment Counter',
            child: Column(children: [
                Icon(Icons.check_circle),
                Text("apply")

            ]

            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,



    );
  }

  String _group (Map<String, dynamic> requirements, String category){
    String group_requirements = '';
    for(int i=0; i<posting.reqs[category].length;i++){
      group_requirements +=('\n- '+posting.reqs[category][i]+'\n');
    }

    return group_requirements;
  }
}
