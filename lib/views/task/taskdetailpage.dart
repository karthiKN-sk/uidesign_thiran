import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:uidesign_thiran/animation/fade_animation.dart';
import 'package:uidesign_thiran/utils/constant.dart';
import 'package:uidesign_thiran/widgets/herotag.dart';

import '../../models/task_data_models.dart';
import '../../utils/app_themes.dart';
import '../../utils/size_config.dart';
import '../../widgets/headingwidget.dart';

class TaskDetailPage extends StatefulWidget {
  final TaskListDataModel model;
  const TaskDetailPage({super.key, required this.model});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late ThemeData themeData;
  List<bool> showQty = [];
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: AppSize.s50,
            width: AppSize.s50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeData.colorScheme.background,
            ),
            child: Icon(
              size: AppSize.s22,
              Icons.arrow_back_ios_new,
              color: themeData.colorScheme.primary,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: AppSize.s20!),
              child: FaIcon(
                size: AppSize.s20,
                FontAwesomeIcons.ellipsisVertical,
                color: themeData.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(
              0.6,
              child: Padding(
                padding: EdgeInsets.only(left: AppSize.s15!, top: AppSize.s8!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroWidget(
                      tag: widget.model.title!,
                      child: Text(
                        widget.model.title!,
                        style: AppTheme.getTextStyle(
                          fontSize: AppSize.s20,
                          fontWeight: 800,
                          color: themeData.colorScheme.primary,
                        ),
                      ),
                    ),
                    verticalSpace(AppSize.s8!),
                    Text(
                      widget.model.desc!,
                      style: AppTheme.getTextStyle(
                        fontSize: AppSize.s14,
                        fontWeight: 700,
                        color: themeData.colorScheme.onPrimary.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(AppSize.s20!),
            FadeAnimation(
              0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: HeroWidget(
                      tag: widget.model.percent!.toString(),
                      child: CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 10.0,
                        animation: true,
                        animationDuration: 1200,
                        percent: widget.model.percent! / 100,
                        center: Text(
                          "${widget.model.percent!.toInt()}%",
                          style: AppTheme.getTextStyle(
                            fontSize: AppSize.s16,
                            fontWeight: 800,
                            color: themeData.colorScheme.primary,
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: widget.model.color!,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Team",
                          style: AppTheme.getTextStyle(
                            fontSize: AppSize.s16,
                            fontWeight: 800,
                            color: themeData.colorScheme.primary,
                          ),
                        ),
                        verticalSpace(AppSize.s8!),
                        AvatarStack(
                          height: AppSize.s38,
                          width: AppSize.screenWidth / 3,
                          borderWidth: 1,
                          borderColor: themeData.colorScheme.background,
                          settings: RestrictedPositions(
                            maxCoverage: 0.4,
                            minCoverage: 0.1,
                            align: StackAlign.right,
                            laying: StackLaying.last,
                            infoIndent: 5,
                          ),
                          infoWidgetBuilder: (surplus) => infoWidget(
                            surplus,
                            context,
                            themeData,
                          ),
                          avatars: [
                            for (var n = 0;
                                n < widget.model.teamList!.length;
                                n++)
                              NetworkImage(
                                widget.model.teamList![n],
                              ),
                          ],
                        ),
                        verticalSpace(AppSize.s12!),
                        Text(
                          "Deadline",
                          style: AppTheme.getTextStyle(
                            fontSize: AppSize.s16,
                            fontWeight: 800,
                            color: themeData.colorScheme.primary,
                          ),
                        ),
                        verticalSpace(AppSize.s15!),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              size: AppSize.s18!,
                              color: themeData.colorScheme.onSecondaryContainer,
                            ),
                            horizontalSpace(AppSize.s5),
                            Text(
                              widget.model.date!,
                              style: AppTheme.getTextStyle(
                                fontSize: AppSize.s12,
                                fontWeight: 700,
                                color: themeData.colorScheme.onPrimary
                                    .withOpacity(.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(AppSize.s25!),
            FadeAnimation(
              1.0,
              child: HeadingSeeAll(
                title: "Project Progress",
                fontSize: AppSize.s20,
              ),
            ),
            verticalSpace(AppSize.s8!),
            ListView.builder(
              itemCount: widget.model.progressList!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                  1.1,
                  child: buildProjectCheck(widget.model.progressList![index],
                      widget.model.progressList!.length, index),
                );
              },
            ),
            verticalSpace(AppSize.s15!),
            FadeAnimation(
              1.3,
              child: HeadingSeeAll(
                title: "Project Overview",
                fontSize: AppSize.s20,
                seeAll: Row(
                  children: [
                    Text(
                      "Weekly",
                      style: AppTheme.getTextStyle(
                        fontSize: AppSize.s14,
                        fontWeight: 700,
                        color: themeData.colorScheme.onSecondaryContainer,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                onTap: () {},
              ),
            ),
            verticalSpace(AppSize.s20!),
            FadeAnimation(
              1.4,
              child: Container(
                margin: EdgeInsets.only(right: AppSize.s15!),
                width: AppSize.screenWidth,
                child: AspectRatio(
                  aspectRatio: 3 / 1.8,
                  child: LineChart(
                    duration: const Duration(microseconds: 500),
                    LineChartData(
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 7,
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              String text = "";
                              switch (value.toInt()) {
                                case 1:
                                  text = "Sun";
                                  break;
                                case 2:
                                  text = "Mon";
                                  break;
                                case 3:
                                  text = "Tue";
                                  break;
                                case 4:
                                  text = "Wed";
                                  break;
                                case 5:
                                  text = "Thu";
                                  break;
                                case 6:
                                  text = "Fri";
                                  break;
                                case 7:
                                  text = "Sat";
                                  break;
                              }
                              return Text(
                                text,
                                style: AppTheme.getTextStyle(
                                  fontSize: AppSize.s16,
                                  color: themeData.colorScheme.onPrimary,
                                  letterSpacing: 0,
                                  fontWeight: 700,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 0),
                            const FlSpot(1, 2),
                            const FlSpot(2, 1.5),
                            const FlSpot(3, 3.5),
                            const FlSpot(4, 4.5),
                            const FlSpot(5, 4.5),
                            const FlSpot(6, 5.5),
                            const FlSpot(7, 6.5),
                          ],
                          isCurved: true,
                          dotData: const FlDotData(show: false),
                          color: widget.model.color,
                          barWidth: 5,
                          belowBarData: BarAreaData(
                            show: true,
                            color: widget.model.color!.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(AppSize.s60!),
          ],
        ),
      ),
    );
  }

  Padding buildProjectCheck(String str, int length, int index) {
    for (int i = 0; i < length; i++) {
      showQty.add(false);
    }
    return Padding(
      padding: EdgeInsets.only(left: AppSize.s20!),
      child: InkWell(
        onTap: () {
          setState(() {
            showQty[index] = !showQty[index];
          });
        },
        child: Row(
          children: [
            Checkbox(
                value: showQty[index],
                checkColor: themeData.colorScheme.background,
                activeColor: themeData.colorScheme.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  setState(() {
                    showQty[index] = value!;
                  });
                }),
            Text(
              str,
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s18,
                color: themeData.colorScheme.onPrimary,
                letterSpacing: 0,
                fontWeight: 700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
