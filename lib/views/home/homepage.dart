import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:uidesign_thiran/animation/fade_animation.dart';
import 'package:uidesign_thiran/utils/app_themes.dart';
import 'package:uidesign_thiran/utils/constant.dart';
import 'package:uidesign_thiran/utils/size_config.dart';
import 'package:uidesign_thiran/widgets/headingwidget.dart';

import '../../models/grid_data_model.dart';
import '../../models/task_data_models.dart';
import '../../widgets/herotag.dart';
import '../task/taskdetailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.onBackground,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Profile and Search Section As AppBar
          ProfileAndSearchWidget(themeData: themeData),

          ///Welcome Text Section
          HelloTextWidget(themeData: themeData),

          ///Four Cards with Icons Task
          TaskGridswidget(themeData: themeData),

          ///Heading For Daily Task and View All Task
          FadeAnimation(
            1.3,
            child: HeadingSeeAll(
              title: "Daily Task",
              fontSize: AppSize.s20,
              seeAll: Row(
                children: [
                  Text(
                    "All Task",
                    style: AppTheme.getTextStyle(
                      fontSize: AppSize.s14,
                      fontWeight: 700,
                      color: themeData.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
              onTap: () {},
            ),
          ),

          ///List of Daily Task Card and View All Task
          ListView.builder(
            itemCount: taskListDataModel.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              TaskListDataModel model = taskListDataModel[index];
              return DailyCardWidget(
                themeData: themeData,
                model: model,
              );
            },
          ),
          verticalSpace(AppSize.s50),
        ],
      )),
    );
  }
}

class DailyCardWidget extends StatelessWidget {
  const DailyCardWidget({
    super.key,
    required this.themeData,
    required this.model,
  });
  final TaskListDataModel model;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.4,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskDetailPage(model: model),
            ),
          );
        },
        child: Container(
          width: AppSize.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12!),
            color: themeData.colorScheme.background,
            boxShadow: singleBoxShadow(),
          ),
          padding: EdgeInsets.all(AppSize.s15!),
          margin: EdgeInsets.only(
              left: AppSize.s10!, right: AppSize.s10!, top: AppSize.s10!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: themeData.colorScheme.onSecondary,
                  ),
                  horizontalSpace(AppSize.s5!),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: AppSize.s8!),
                        child: HeroWidget(
                          tag: model.title!,
                          child: Text(
                            model.title!,
                            style: AppTheme.getTextStyle(
                              fontSize: AppSize.s15,
                              fontWeight: 800,
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(AppSize.s6!),
                      LinearPercentIndicator(
                        alignment: MainAxisAlignment.center,
                        width: AppSize.screenWidth / 2.2,
                        animation: true,
                        lineHeight: 10,
                        animationDuration: 2000,
                        percent: model.percent! / 100,
                        barRadius: Radius.circular(AppSize.s15!),
                        progressColor: model.color!,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  AvatarStack(
                    height: AppSize.s38,
                    width: AppSize.screenWidth / 4,
                    borderWidth: 1,
                    borderColor: themeData.colorScheme.background,
                    settings: RestrictedPositions(
                      maxCoverage: 0.7,
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
                      for (var n = 0; n < model.teamList!.length; n++)
                        NetworkImage(
                          model.teamList![n],
                        ),
                    ],
                  ),
                  const FaIcon(Icons.arrow_forward_ios),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskGridswidget extends StatelessWidget {
  const TaskGridswidget({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSize.s10!),
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: AppSize.s10!, top: AppSize.s10!),
        itemCount: taskGridModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          childAspectRatio: 3 / 1.8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          TaskGridModel model = taskGridModel[index];
          return FadeAnimation(
            1.2,
            child: Container(
              height: AppSize.screenHeight / 5,
              width: AppSize.screenWidth / 2,
              decoration: BoxDecoration(
                color: model.color!,
                borderRadius: BorderRadius.circular(AppSize.s15!),
                // image: DecorationImage(
                //   image: AssetImage(model.imageUrl!),
                //   fit: BoxFit.cover,
                //   colorFilter: ColorFilter.mode(
                //     model.color!,
                //     BlendMode.dstATop,
                //   ),
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    model.icon!,
                    color: themeData.colorScheme.background,
                    size: 35,
                  ),
                  verticalSpace(AppSize.s8),
                  Text(
                    model.title!,
                    style: AppTheme.getTextStyle(
                      fontSize: AppSize.s15,
                      fontWeight: 700,
                      color: themeData.colorScheme.background,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.s15!, right: AppSize.s20!, top: AppSize.s10!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///Employee Name
          FadeAnimation(
            0.8,
            child: Text(
              "Hello",
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s18,
                fontWeight: 700,
                color: themeData.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          verticalSpace(AppSize.s5),
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
        ],
      ),
    );
  }
}

class ProfileAndSearchWidget extends StatelessWidget {
  const ProfileAndSearchWidget({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.5,
      child: Container(
        padding: EdgeInsets.all(AppSize.s8!),
        width: AppSize.screenWidth,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            horizontalSpace(AppSize.s8),
            InkWell(
              onTap: () {},
              child: HeroWidget(
                tag: randomImages.last,
                child: Container(
                  height: AppSize.s50,
                  width: AppSize.s50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeData.colorScheme.background.withOpacity(.4),
                    image: DecorationImage(
                        image: NetworkImage(randomImages.last),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: AppSize.s50,
                    width: AppSize.s50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            themeData.colorScheme.background.withOpacity(.4)),
                    child: Icon(
                      size: AppSize.s20,
                      FontAwesomeIcons.magnifyingGlass,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                ),
                horizontalSpace(AppSize.s2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
