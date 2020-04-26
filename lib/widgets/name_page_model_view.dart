import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sjb/models/page_model.dart';
import 'package:sjb/models/user.dart';

class NamePageModelView extends StatelessWidget {
  final PageController controller;

  final Color color;
  final Image hero;
  final Image icon;
  final String title;
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();

  NamePageModelView(PageModel pageModel, this.controller)
      : color = pageModel.color,
        title = pageModel.title,
        hero = NamePageModelView.renderImageAsset(pageModel.heroAssetPath,
            width: 200, height: 200),
        icon = NamePageModelView.renderImageAsset(pageModel.iconAssetPath);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context, listen: false);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hero,
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: color,
                fontSize: 34.0,
              )),
          Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                children: <Widget>[
                  TextField(
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      onSubmitted: (String data) {
                        user.name = data;
                        focusEmail.requestFocus();
                      },
                      decoration: InputDecoration(hintText: 'Name'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      )),
                  TextFormField(
                      textInputAction: TextInputAction.go,
                      focusNode: focusEmail,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String data) {
                        user.email = data;
                        focusPassword.requestFocus();
                      },
                      decoration: InputDecoration(hintText: 'Email'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      )),
                  TextFormField(
                    focusNode: focusPassword,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Enter your password'),
                    // The validator receives the text that the user has entered.
                    onFieldSubmitted: (String data) {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        user.password = value;
                      }
                      return null;
                    },
                  ),
                ],
              )),
        ]);
  }

  static Widget renderImageAsset(String assetPath,
      {double width = 24, double height = 24, Color color}) {
    return Image.asset(
      assetPath,
      color: color,
      width: width,
      height: height,
    );
  }
}
