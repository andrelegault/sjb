import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sjb/models/user.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Icon(Icons.home)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Hi, ${Provider.of<User>(context).name}!'),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Visit listings'),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/listings')),
                  RaisedButton(
                      child: Text('Log out'),
                      onPressed: () {
                        Provider.of<User>(context, listen: false).clear();
                        Navigator.of(context).pop();
                      }),
                ]),
          ],
        )),
      );
}
