import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:sjb/models/page_model.dart';

import 'name_page_model_view.dart';

class BirthdayPageModelView extends StatefulWidget {
  final PageModel pageModel;
  final PageController controller;

  BirthdayPageModelView({this.pageModel, this.controller});

  @override
  State<StatefulWidget> createState() =>
      BirthdayPageModelState(pageModel, controller);
}

class BirthdayPageModelState extends State<BirthdayPageModelView>
    with AutomaticKeepAliveClientMixin<BirthdayPageModelView> {
  Color color = Colors.white;
  Image hero;
  Image icon;
  String title;
  DateTime bd;
  Function onUpdate;
  PageController controller;
  DateFormat fmt = DateFormat.yMMMd();

  BirthdayPageModelState(PageModel pageModel, this.controller)
      : color = pageModel.color,
        title = pageModel.title,
        hero = NamePageModelView.renderImageAsset(pageModel.heroAssetPath,
            height: 300, width: 300),
        icon = NamePageModelView.renderImageAsset(pageModel.iconAssetPath);

  void _updateBirthday(DateTime other) => setState(() => bd = other);

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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1950, 1, 1),
                        maxTime: DateTime(2019, 6, 7),
                        onChanged: null, onConfirm: (DateTime date) {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                      _updateBirthday(date);
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    bd == null ? 'Tap me to pick a date!' : fmt.format(bd),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  )),
            ]),
          ]),
        ]);
  }

  @override
  bool get wantKeepAlive => true;
}
