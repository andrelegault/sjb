import 'package:flutter/material.dart';
import 'package:sjb/screens/singlePosting/button_column.dart';

class ButtonSection extends StatelessWidget {

  final Color color;

  ButtonSection({
    this.color
  });

  @override
  Widget build(BuildContext context) {

    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Confirmed"),
            content: new Text("You have applied to this job!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width:2),
//        color: Colors.cyan,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonColumn(color: color, icon: Icons.arrow_back, label: 'Previous Job'),
          RaisedButton(
            onPressed: () => _showDialog(),
            elevation: 10.0,
            color: Colors.white,
            textColor: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonColumn(color: color, icon: Icons.arrow_forward, label: 'Next Job'),
        ],
      ),
    );
  }


}
