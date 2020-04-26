import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sjb/screens/singlePosting/page_section.dart';
import '../../models/listing.dart';

class SingleListingScreen extends StatelessWidget {
  static const routeName = 'single-post';
  final DateFormat fmt = DateFormat.yMMMd();

  final Listing listing;
  SingleListingScreen(this.listing);

  @override
  Widget build(BuildContext context) {
    String minRequirements = _group(listing.reqs, 'minimal');
    String prefRequirements = _group(listing.reqs, 'preferred');

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
        title: Text(listing.employer),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
//                ButtonSection(color: Colors.black),
        PageSection(title: 'Position', description: listing.title),
        PageSection(title: "Job Location", description: listing.location),
        PageSection(title: "Date", description: fmt.format(listing.date)),
        PageSection(
            title: 'Company Description', description: listing.description),
        PageSection(title: 'Responsabilities', description: listing.resp[0]),
        PageSection(
            title: 'Minimal Requirements', description: minRequirements),
        PageSection(
            title: 'Preferred Qualifications', description: prefRequirements),
//                PageSection(title: 'Link', description: listing.url),
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
    for (int i = 0; i < listing.reqs[category].length; i++) {
      groupRequirements += ('\n- ' + listing.reqs[category][i] + '\n');
    }

    return groupRequirements;
  }
}
