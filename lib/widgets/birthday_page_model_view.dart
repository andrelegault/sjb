import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sjb/models/page_model.dart';
import 'package:sjb/models/user.dart';

import 'name_page_model_view.dart';

class BirthdayPageModelView extends StatelessWidget {
  final PageController controller;

  final Color color;
  final Image hero;
  final Image icon;
  final String title;
  final DateFormat fmt = DateFormat.yMMMd();

  BirthdayPageModelView(PageModel pageModel, this.controller)
      : color = pageModel.color,
        title = pageModel.title,
        hero = NamePageModelView.renderImageAsset(pageModel.heroAssetPath,
            height: 300, width: 300),
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
                      user.dob = date;
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    user.dob == null
                        ? 'Tap me to pick a date!'
                        : fmt.format(user.dob),
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
}
