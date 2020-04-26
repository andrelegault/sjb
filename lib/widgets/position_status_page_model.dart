import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sjb/models/page_model.dart';
import 'package:sjb/models/user.dart';

import 'name_page_model_view.dart';

class PositionStatusPageModelView extends StatelessWidget {
  final Color color;
  final Image hero;
  final Image icon;
  final String title;

  PositionStatusPageModelView(PageModel pageModel)
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
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: color,
                  fontSize: 34.0,
                )),
          ),
          Column(children: <Widget>[
            ToggleButtons(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text('Part Time')]),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text('Full Time')]),
                  ),
                ),
              ],
              onPressed: (int index) {
                for (int buttonIndex = 0;
                    buttonIndex < user.statusSelection.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    user.statusSelection[buttonIndex] = true;
                    user.positionStatus = index == 1
                        ? PositionStatus.full_time
                        : PositionStatus.part_time;
                  } else {
                    user.statusSelection[buttonIndex] = false;
                  }
                }
                // user.save();
                user.update();
                Navigator.of(context).popAndPushNamed('/home');
              },
              isSelected: user.statusSelection,
            )
          ])
        ]);
  }
}
