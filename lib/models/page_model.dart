import 'package:flutter/material.dart';

class PageModel {
  Color color = Colors.white;
  String heroAssetPath;
  String iconAssetPath;
  final String title;

  PageModel({
    @required this.heroAssetPath,
    @required this.iconAssetPath,
    @required this.title,
    this.color,
  });
}
