import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sjb/models/page_model.dart';
import 'package:sjb/models/user.dart';

import 'name_page_model_view.dart';

class LocationPageModelView extends StatelessWidget {
  final Color color;
  final Image hero;
  final Image icon;
  final String title;
  final PageController controller;

  LocationPageModelView(PageModel pageModel, this.controller)
      : color = pageModel.color,
        title = pageModel.title,
        hero = NamePageModelView.renderImageAsset(pageModel.heroAssetPath,
            width: 200, height: 200),
        icon = NamePageModelView.renderImageAsset(pageModel.iconAssetPath);

  @override
  Widget build(BuildContext context) {
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
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: <Widget>[
                  TextField(
                      textInputAction: TextInputAction.go,
                      onSubmitted: (String data) {
                        Provider.of<User>(context, listen: false).city = data;
                        controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      decoration: InputDecoration(hintText: 'City'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      )),
                ],
              )),
        ]);
  }
}
