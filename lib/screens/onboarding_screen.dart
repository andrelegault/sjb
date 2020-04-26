// Define a custom Form widget.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OnBoardingScreenState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class OnBoardingScreenState extends State<OnBoardingScreen> {
  DateTime bd;
  DateFormat fmt = DateFormat.yMMMd();
  List<bool> isSelected = [true, false, false, false];

  void _updateBirthday(DateTime date) {
    print('selected birthday $date');
    setState(() {
      bd = date;
      print("updated");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(bd == null ? 'Student Job Board' : fmt.format(bd))),
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: <PageModel>[
          PageModel(
              color: const Color(0xFF678FB4),
              heroAssetPath: 'assets/images/user.png',
              title: Text('What\'s your name?',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 34.0,
                  )),
              body: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: <Widget>[
                      TextField(
                          decoration: InputDecoration(hintText: 'Name'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          )),
                    ],
                  )),
              iconAssetPath: 'assets/images/user.png'),
          PageModel(
              color: const Color(0xFF678FB4),
              heroAssetPath: 'assets/images/cake.png',
              title: Text('When were you born?',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 34.0,
                  )),
              body: Column(children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1950, 1, 1),
                            maxTime: DateTime(2019, 6, 7),
                            onChanged: null,
                            onConfirm: (DateTime date) => _updateBirthday(date),
                            currentTime: DateTime.now(),
                            locale: LocaleType.en);
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
              iconAssetPath: 'assets/images/cake.png'),
          PageModel(
              color: const Color(0xFF678FB4),
              heroAssetPath: 'assets/images/school.png',
              title: Text('What do you study?',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 34.0,
                  )),
              body: Column(children: <Widget>[
                Text('Choose your field of study',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )),
                ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.call),
                    Icon(Icons.call),
                    Icon(Icons.cake),
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
                ),
              ]),
              iconAssetPath: 'assets/images/cake.png'),
        ],
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/'),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/'),
      ),
    );
  }
}
