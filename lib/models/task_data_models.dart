import 'package:flutter/material.dart';

import '../utils/app_themes.dart';

class TaskListDataModel {
  String? desc;
  String? title;
  String? date;
  double? percent;
  Color? color;
  List<String>? teamList;
  List<String>? progressList;

  TaskListDataModel({
    this.desc,
    this.title,
    this.date,
    this.progressList,
    this.percent,
    this.color,
    this.teamList,
  });
}

List<TaskListDataModel> taskListDataModel = [
  TaskListDataModel(
    title: "App Animation",
    desc: "Today Shared by - Unbox Digital",
    color: AppTheme.lightThemeData.colorScheme.onSecondary,
    percent: 40.0,
    date: "June 15, 2021 - June 21, 2021",
    progressList: [
      "Create User Flow",
      "Create Wireframe",
      "Transform to Visual Design"
    ],
    teamList: [
      'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://www.course-api.com/images/people/person-3.jpeg',
    ],
  ),
  TaskListDataModel(
    title: "DashBoard Design",
    desc: "Today Shared by - Ui Been",
    color: AppTheme.lightThemeData.colorScheme.primary,
    percent: 60,
    date: "July 15, 2021 - August 21, 2021",
    progressList: [
      "Create User Flow",
      "Create Design",
      "Transform to Visual Design"
    ],
    teamList: [
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://www.course-api.com/images/people/person-3.jpeg',
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
    ],
  ),
  TaskListDataModel(
    title: "UI/UX Design",
    desc: "Today Shared by - Unbox",
    color: AppTheme.lightThemeData.colorScheme.inversePrimary,
    percent: 80,
    date: "Jan 10, 2021 - Feb 28, 2021",
    progressList: [
      "Planning",
      "Create User Flow",
      "Create Design",
      "Visual Design Functionality"
    ],
    teamList: [
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
      'https://www.course-api.com/images/people/person-1.jpeg',
      'https://www.course-api.com/images/people/person-4.jpeg',
    ],
  ),
  TaskListDataModel(
    title: "Task Management",
    desc: "Today Shared by - Unbox",
    color: AppTheme.lightThemeData.colorScheme.secondaryContainer,
    percent: 55,
    date: "May 10, 2021 - July 28, 2021",
    progressList: [
      "Planning",
      "Create User Flow",
      "Create Design",
      "Functionality",
      "Testing"
    ],
    teamList: [
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
      'https://www.course-api.com/images/people/person-1.jpeg',
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
    ],
  ),
  TaskListDataModel(
    title: "Manage Your Task",
    desc: "Today Shared by - Unbox",
    color: Colors.purple,
    percent: 78,
    date: "May 10, 2022 - July 28, 2022",
    progressList: [
      "Planning",
      "Create Design",
      "Functionality",
      "Testing",
      "Create User Flow",
    ],
    teamList: [
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://www.course-api.com/images/people/person-1.jpeg',
      'https://www.course-api.com/images/people/person-4.jpeg',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://www.course-api.com/images/people/person-2.jpeg',
    ],
  ),
];
