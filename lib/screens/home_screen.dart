import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Hi, User!"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Text("Visit listings"),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/listings'))
                  ]),
            ],
          ),
        ),
      );
}
