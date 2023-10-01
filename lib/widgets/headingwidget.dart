// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:uidesign_thiran/utils/app_themes.dart';
import 'package:uidesign_thiran/utils/size_config.dart';

class HeadingSeeAll extends StatelessWidget {
  final String title;
  final Widget? seeAll;
  final GestureTapCallback? onTap;
  final Color? textColor;
  final double? fontSize;
  HeadingSeeAll({
    Key? key,
    required this.title,
    this.onTap,
    this.seeAll,
    this.textColor,
    this.fontSize,
  }) : super(key: key);

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: AppSize.s2, left: AppSize.s15!, right: AppSize.s18!),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: AppTheme.getTextStyle(
              fontSize: fontSize ?? AppSize.s16,
              fontWeight: 800,
              height: 1.2,
              color: textColor ?? themeData.colorScheme.onPrimary,
            ),
          ),
          if (seeAll != null) const Spacer(),
          if (seeAll != null) InkWell(onTap: onTap, child: seeAll),
        ],
      ),
    );
  }
}
