import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/app_themes.dart';
import '../utils/size_config.dart';
import '../widgets/herotag.dart';
import 'dashboard/dashboard.dart';

class SplashImageScreen extends StatefulWidget {
  const SplashImageScreen({super.key});

  @override
  State<SplashImageScreen> createState() => _SplashImageScreenState();
}

class _SplashImageScreenState extends State<SplashImageScreen> {
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    navigation();
  }

  navigation() {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://media.istockphoto.com/id/1256489977/vector/tasks-check-checklist-blue-icon.jpg?s=612x612&w=0&k=20&c=dUctYWRSmMz1uiSFCCcJUKOyeoxVbvPuLugf8CLQiSo="),
          verticalSpace(AppSize.s20),
          HeroWidget(
            tag: "Thiran Technologies",
            child: Text(
              "Thiran Technologies",
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s22,
                fontWeight: 800,
                color: themeData.colorScheme.primary,
              ),
            ),
          ),
          verticalSpace(AppSize.s10),
          Text(
            "UI Task",
            style: AppTheme.getTextStyle(
              fontSize: AppSize.s22,
              fontWeight: 800,
              color: themeData.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
