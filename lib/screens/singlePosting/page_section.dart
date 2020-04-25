import 'package:flutter/material.dart';

class PageSection extends StatelessWidget {
  final String title;
  final String description;

  PageSection({
    this.title,
    this.description
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
//            Color(0xFF0D47A1),
//            Color(0xFF1976D2),
//            Color(0xFFFCE4EC),
            Color(0xFFFCE4EC),
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0xFFFCE4EC),
          ],
        ),
      ),
//      color: Colors.cyan[700],
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10), //left, top, right, bottom
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
//                  color: Colors.yellow[200],
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize:16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
