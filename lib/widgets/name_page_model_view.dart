import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sjb/models/page_model.dart';

class NamePageModelView extends StatefulWidget {
  final PageModel pageModel;
  final Widget body;
  final Function onUpdate;
  NamePageModelView({this.pageModel, this.body, this.onUpdate});

  @override
  State<StatefulWidget> createState() => _PageModelViewState(pageModel, body);

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

class _PageModelViewState extends State<NamePageModelView>
    with AutomaticKeepAliveClientMixin<NamePageModelView> {
  Color color = Colors.white;
  Image hero;
  Image icon;
  String title;
  Widget body;

  _PageModelViewState(PageModel pageModel, this.body)
      : color = pageModel.color,
        title = pageModel.title,
        hero = NamePageModelView.renderImageAsset(pageModel.heroAssetPath,
            width: 200, height: 200),
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
          Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: <Widget>[
                  TextField(
                      decoration: InputDecoration(hintText: 'Name'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      )),
                ],
              )),
        ]);
  }

  @override
  bool get wantKeepAlive => true;
}
