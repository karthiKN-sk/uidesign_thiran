import 'package:flutter/material.dart';
import 'package:uidesign_thiran/utils/app_themes.dart';

class TaskGridModel {
  String? imageUrl;
  String? title;
  IconData? icon;
  Color? color;

  TaskGridModel({this.imageUrl, this.title, this.icon, this.color});
}

List<TaskGridModel> taskGridModel = [
  TaskGridModel(
    imageUrl: "assets/images/Agriculture.jpg",
    title: "In Progress",
    icon: Icons.timer,
    color: AppTheme.lightThemeData.colorScheme.onSecondary,
  ),
  TaskGridModel(
    imageUrl: "assets/images/Artist.jpg",
    title: "Ongoing",
    icon: Icons.repeat,
    color: AppTheme.lightThemeData.colorScheme.primary,
  ),
  TaskGridModel(
    imageUrl: "assets/images/Automobile.jpg",
    title: "Completed",
    icon: Icons.checklist_sharp,
    color: AppTheme.lightThemeData.colorScheme.inversePrimary,
  ),
  TaskGridModel(
    imageUrl: "assets/images/Blogger.jpg",
    title: "Cancel",
    icon: Icons.note_add,
    color: AppTheme.lightThemeData.colorScheme.secondaryContainer,
  ),
];
