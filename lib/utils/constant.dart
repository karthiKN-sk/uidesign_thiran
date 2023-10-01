import 'package:flutter/material.dart';

import 'package:uidesign_thiran/utils/size_config.dart';

List randomImages = [
  'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
  'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
  'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
  'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
  'https://www.course-api.com/images/people/person-4.jpeg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
  'https://www.course-api.com/images/people/person-1.jpeg',
  'https://www.course-api.com/images/people/person-4.jpeg',
  'https://www.course-api.com/images/people/person-3.jpeg',
  'https://www.course-api.com/images/people/person-2.jpeg',
];

List<BoxShadow> singleBoxShadow() {
  List<BoxShadow> boxshadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 6,
      offset: const Offset(0, 1), // changes position of shadow
    ),
  ];
  return boxshadow;
}

Widget infoWidget(
  int surplus,
  BuildContext context,
  ThemeData themeData,
) {
  return FittedBox(
    fit: BoxFit.contain,
    child: Container(
      height: AppSize.s22,
      width: AppSize.s22,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: themeData.colorScheme.onSecondary),
      child: Center(
          child: Icon(
        Icons.add,
        color: themeData.colorScheme.background,
        size: 16,
      )),
    ),
  );
}
