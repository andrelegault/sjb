// Define a custom Form widget.
import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/images/cake.png',
        title: Text('Name',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('All hotels and hostels are sorted by hospitality rating',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/cake.png'),
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/images/cake.png',
        title: Text('Birthday',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('All hotels and hostels are sorted by hospitality rating',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/cake.png'),
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/images/cake.png',
        title: Text('Age',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('All hotels and hostels are sorted by hospitality rating',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/cake.png'),
  ];

  @override
  Widget build(BuildContext context) =>
      // Build a Form widget using the _formKey created above.
      Scaffold(
        appBar: AppBar(title: Text('Student Job Board')),
        body: FancyOnBoarding(
          doneButtonText: "Done",
          skipButtonText: "Skip",
          pageList: pageList,
          onDoneButtonPressed: () =>
              Navigator.of(context).pushReplacementNamed('/'),
          onSkipButtonPressed: () =>
              Navigator.of(context).pushReplacementNamed('/'),
        ),
      );
}
