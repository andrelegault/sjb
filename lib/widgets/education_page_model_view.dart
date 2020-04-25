import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sjb/models/page_model.dart';

import 'name_page_model_view.dart';

class EducationPageModelView extends StatefulWidget {
  final PageModel pageModel;
  EducationPageModelView({this.pageModel});

  @override
  State<StatefulWidget> createState() => EducationPageModelState(pageModel);
}

class EducationPageModelState extends State<EducationPageModelView>
    with AutomaticKeepAliveClientMixin<EducationPageModelView> {
  Color color = Colors.white;
  Image hero;
  Image icon;
  String title;
  DateTime bd;
  Function onUpdate;
  List<bool> isSelected = [true, false];

  EducationPageModelState(PageModel pageModel)
      : color = pageModel.color,
        title = pageModel.title,
        hero = NamePageModelView.renderImageAsset(pageModel.heroAssetPath,
            height: 200, width: 200),
        icon = NamePageModelView.renderImageAsset(pageModel.iconAssetPath);

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                    setState(() {
                      isSelected = isSelected;
                    });
                  }
                });
              },
              isSelected: isSelected,
            )
          ])
        ]);
  }

  @override
  bool get wantKeepAlive => true;
}
