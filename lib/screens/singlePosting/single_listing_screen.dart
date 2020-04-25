import 'package:flutter/material.dart';
import 'package:sjb/screens/singlePosting/page_section.dart';
import '../../models/listing.dart';

class SingleListingScreen extends StatelessWidget {
  static const routeName = 'single-post';

  final Posting posting;
  SingleListingScreen(this.posting);

  @override
  Widget build(BuildContext context) {
    String minRequirements = _group(posting.reqs, 'minimal');
    String prefRequirements = _group(posting.reqs, 'preferred');

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
        title: Text(posting.employer),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
//                ButtonSection(color: Colors.black),
        PageSection(title: 'Position', description: posting.title),
        PageSection(title: "Job Location", description: posting.location),
        PageSection(title: "Term", description: posting.term),
        PageSection(
            title: 'Company Description', description: posting.description),
        PageSection(title: 'Responsabilities', description: posting.resp[0]),
        PageSection(
            title: 'Minimal Requirements', description: minRequirements),
        PageSection(
            title: 'Preferred Qualifications', description: prefRequirements),
//                PageSection(title: 'Link', description: posting.url),
      ])),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () => _showDialog(),
          tooltip: 'Increment Counter',
          child: Column(children: [Icon(Icons.check_circle), Text("apply")]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  String _group(Map<String, dynamic> requirements, String category) {
    String groupRequirements = '';
    for (int i = 0; i < posting.reqs[category].length; i++) {
      groupRequirements += ('\n- ' + posting.reqs[category][i] + '\n');
    }

    return groupRequirements;
  }
}
