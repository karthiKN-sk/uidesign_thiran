import 'package:flutter/material.dart';
import 'package:uidesign_thiran/utils/app_themes.dart';
import 'package:uidesign_thiran/utils/size_config.dart';

import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return MaterialApp(
      title: 'Thiran Technologies UI Task',
      theme: AppTheme.lightThemeData,
      home: const SafeArea(child: SplashImageScreen()),
    );
  }
}
