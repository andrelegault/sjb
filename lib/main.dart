import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sjb/screens/login_screen.dart';
import 'package:sjb/screens/singlePosting/single_listing_screen.dart';
import 'package:sjb/models/listing.dart';

import 'models/user.dart';
import 'screens/home_screen.dart';
import 'screens/listings_screen.dart';
import 'screens/new_on_boarding_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => User(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Posting samplePost = Posting(
      title:'Sample Title',
      location: 'Sample Location',
      employer: 'Sample Employer',
      term: 'Sample Term',
      logo: 'Sample Logo',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      url: 'Sample URL'
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/onboarding': (context) => NewOnBoardingScreen(),
        '/listings': (context) => ListingsScreen(),
//        '/listings': (context) => SingleListingScreen(samplePost),
        '/home': (context) => HomeScreen(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
