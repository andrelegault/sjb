import 'package:flutter/material.dart';
import 'package:sjb/screens/singlePosting/button_column.dart';

class ButtonSection extends StatelessWidget {

  final Color color;

  ButtonSection({
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width:2),
        color: Colors.cyan,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonColumn(color: color, icon: Icons.arrow_back, label: 'Previous Job'),
          ButtonColumn(color: color, icon: Icons.done_outline, label: 'APPLY'),
          ButtonColumn(color: color, icon: Icons.arrow_forward, label: 'Next Job'),
        ],
      ),
    );
  }
}
