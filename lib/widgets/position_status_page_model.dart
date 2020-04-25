import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sjb/models/page_model.dart';

import 'name_page_model_view.dart';

class PositionStatusPageModelView extends StatefulWidget {
  final PageModel pageModel;
  PositionStatusPageModelView({this.pageModel});

  @override
  State<StatefulWidget> createState() => PositionStatusPageModelState(pageModel);
}

class PositionStatusPageModelState extends State<PositionStatusPageModelView>
    with AutomaticKeepAliveClientMixin<PositionStatusPageModelView> {
  Color color = Colors.white;
  Image hero;
  Image icon;
  String title;
  DateTime bd;
  Function onUpdate;
  List<bool> isSelected = [true, false];

  PositionStatusPageModelState(PageModel pageModel)
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
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: 
            Text(title,
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
                        children: <Widget>[
                          Text('Part Time')
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
                          Text('Full Time')
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
                Navigator.of(context).popAndPushNamed('/home');
              },
              isSelected: isSelected,
            )
          ])
        ]);
  }

  @override
  bool get wantKeepAlive => true;
}
