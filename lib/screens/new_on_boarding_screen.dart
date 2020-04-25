import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sjb/models/page_model.dart';
import 'package:sjb/widgets/birthday_page_model_view.dart';
import 'package:sjb/widgets/education_page_model_view.dart';
import 'package:sjb/widgets/location_page_model_view.dart';
import 'package:sjb/widgets/name_page_model_view.dart';
import 'package:sjb/widgets/position_status_page_model.dart';

class NewOnBoardingScreen extends StatefulWidget {
  @override
  NewOnBoardingScreenState createState() => NewOnBoardingScreenState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class NewOnBoardingScreenState extends State<NewOnBoardingScreen> {
  final List<Widget> pageList;
  final PageController controller = PageController(
    initialPage: 0,
  );

  DateTime bd;
  DateFormat fmt = DateFormat.yMMMd();
  List<PageModel> pageModels = [
    PageModel(
        heroAssetPath: 'assets/images/user.png',
        iconAssetPath: 'assets/images/user.png',
        title: 'What\'s your name?'),
    PageModel(
        heroAssetPath: 'assets/images/cake.png',
        iconAssetPath: 'assets/images/cake.png',
        title: 'What\'s your birth date?'),
    PageModel(
        heroAssetPath: 'assets/images/location.png',
        iconAssetPath: 'assets/images/location.png',
        title: 'In what city do you live?'),
    PageModel(
        heroAssetPath: 'assets/images/school.png',
        iconAssetPath: 'assets/images/school.png',
        title: 'What do you study?'),
    PageModel(
        heroAssetPath: 'assets/images/clock.png',
        iconAssetPath: 'assets/images/clock.png',
        title: 'Are you studying full-time or part-time?'),
  ];

  NewOnBoardingScreenState({
    this.pageList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(bd == null ? 'Student Job Board' : fmt.format(bd))),
        body: PageView(controller: controller, children: <Widget>[
          NamePageModelView(pageModel: pageModels[0], controller: controller),
          BirthdayPageModelView(
              pageModel: pageModels[1], controller: controller),
          LocationPageModelView(
              pageModel: pageModels[2], controller: controller),
          EducationPageModelView(
              pageModel: pageModels[3], controller: controller),
          PositionStatusPageModelView(
            pageModel: pageModels[4],
          ),
        ]));
  }
}
