import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sjb/models/listing.dart';
import 'package:sjb/models/user.dart';
import 'package:sjb/screens/singlePosting/single_listing_screen.dart';

class ListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: rootBundle.loadString('assets/data/sample_listings.json'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(child: CircularProgressIndicator());
        } else {
          User user = Provider.of<User>(context);
          List<dynamic> data = json.decode(snapshot.data);
          List<Listing> matchingListings = [];
          data.forEach((data) {
            Listing listing = Listing.fromJson(data);
            if (user.positionStatus == listing.positionStatus &&
                user.studyField == listing.studyField) {
              matchingListings.add(listing);
            }
          });
          return Scaffold(
            body: ListView.builder(
                itemCount: matchingListings.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage(matchingListings[index].logo)),
                      title: Text(
                        matchingListings[index].title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            matchingListings[index].employer,
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RaisedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SingleListingScreen(
                                                matchingListings[index]))),
                                elevation: 1.0,
                                color: Colors.grey,
                                textColor: Colors.white,
                                child: Text("View")),
                            Icon(Icons.keyboard_arrow_right)
                          ]),
                    )),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(
                height: 50.0,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => print("hello"),
              tooltip: 'Increment Counter',
              child: Icon(Icons.search),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        }
      });
}
