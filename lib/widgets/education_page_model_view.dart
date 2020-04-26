import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sjb/models/page_model.dart';
import 'package:sjb/models/user.dart';

import 'name_page_model_view.dart';

class EducationPageModelView extends StatelessWidget {
  final Color color;
  final Image hero;
  final Image icon;
  final String title;
  final PageController controller;

  EducationPageModelView(PageModel pageModel, this.controller)
      : color = pageModel.color,
        title = pageModel.title,
        hero = NamePageModelView.renderImageAsset(pageModel.heroAssetPath,
            height: 200, width: 200),
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
          Column(children: <Widget>[
            Text('Choose your field of study',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
            ToggleButtons(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          Text('Finance')
                        ]),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.computer),
                          Text('Software\nEngineering')
                        ]),
                  ),
                ),
              ],
              onPressed: (int index) {
                for (int buttonIndex = 0;
                    buttonIndex < user.educationSelection.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    user.educationSelection[buttonIndex] = true;
                    user.studyField =
                        index == 0 ? StudyField.finance : StudyField.soen;
                  } else {
                    user.educationSelection[buttonIndex] = false;
                  }
                }
                controller.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              isSelected: user.educationSelection,
            )
          ])
        ]);
  }
}
