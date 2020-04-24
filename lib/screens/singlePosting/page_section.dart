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
      color: Colors.cyan[700],
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
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
