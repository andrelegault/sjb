import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sjb/screens/login_screen.dart';

import 'models/user.dart';
import 'screens/home_screen.dart';
import 'screens/listings_screen.dart';
import 'screens/new_on_boarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  User.loadJson().then((data) => data.forEach((userData) {
        User user = User.fromJson(userData);
        User.users.add(user);
      }));

  runApp(ChangeNotifierProvider(
    create: (context) => User(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/onboarding': (context) => NewOnBoardingScreen(),
        '/listings': (context) => ListingsScreen(),
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
