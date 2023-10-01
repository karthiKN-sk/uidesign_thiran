import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:uidesign_thiran/animation/fade_animation.dart';
import 'package:uidesign_thiran/utils/app_themes.dart';
import 'package:uidesign_thiran/utils/constant.dart';
import 'package:uidesign_thiran/utils/size_config.dart';
import 'package:uidesign_thiran/views/task/taskdetailpage.dart';
import 'package:uidesign_thiran/widgets/headingwidget.dart';

import '../../models/task_data_models.dart';
import '../../widgets/herotag.dart';
import '../home/homepage.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  int? index = 0;
  late ThemeData themeData;
  late TabController controller;

  List<String> tabs = ["All", "Ongoing", "Completed"];
  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
    controller.addListener(() {
      setState(() {
        index = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.onBackground,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: themeData.colorScheme.background,
              expandedHeight: AppSize.s160,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 4,
                background: Container(
                  padding:
                      EdgeInsets.only(left: AppSize.s10!, right: AppSize.s10!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileAndSearchWidget(themeData: themeData),
                      FadeAnimation(
                        1.3,
                        child: HeadingSeeAll(
                          title: "Project",
                          fontSize: AppSize.s20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pinned: true,
              floating: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(AppSize.s60!),
                child: FadeAnimation(
                  1.4,
                  child: Container(
                    width: double.infinity,
                    height: AppSize.s60!,
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.background,
                    ),
                    child: TabBar(
                      tabAlignment: TabAlignment.fill,
                      padding: EdgeInsets.only(
                          top: AppSize.s4!,
                          bottom: AppSize.s4!,
                          left: AppSize.s10!,
                          right: AppSize.s10!),
                      physics: const NeverScrollableScrollPhysics(),
                      isScrollable: false,
                      onTap: ((value) {
                        setState(() {
                          index = value;
                        });
                      }),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppSize.s30!), // Creates border
                        color: themeData.colorScheme.primary,
                      ),
                      controller: controller,
                      tabs: [
                        for (int i = 0; i < tabs.length; i++)
                          Tab(
                            child: Text(
                              tabs[i],
                              style: AppTheme.getTextStyle(
                                fontSize: AppSize.s16,
                                fontWeight: 800,
                                color: index == i
                                    ? themeData.colorScheme.background
                                    : themeData.colorScheme.onPrimary
                                        .withOpacity(0.7),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: controller,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            AllTaskWidget(themeData: themeData),
            Center(
                child: Text(
              "Ongoing",
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s18,
                fontWeight: 800,
                color: themeData.colorScheme.primary,
              ),
            )),
            Center(
                child: Text(
              "Completed",
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s18,
                fontWeight: 800,
                color: themeData.colorScheme.primary,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class AllTaskWidget extends StatelessWidget {
  const AllTaskWidget({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskListDataModel.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: AppSize.s40!),
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        TaskListDataModel model = taskListDataModel[index];
        return AllTaskCardWidget(
          themeData: themeData,
          model: model,
        );
      },
    );
  }
}

class AllTaskCardWidget extends StatelessWidget {
  const AllTaskCardWidget({
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
          // width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12!),
            color: themeData.colorScheme.background,
            boxShadow: singleBoxShadow(),
          ),
          padding: EdgeInsets.all(AppSize.s8!),
          margin: EdgeInsets.only(
              left: AppSize.s10!, right: AppSize.s10!, top: AppSize.s10!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroWidget(
                    tag: model.title!,
                    child: Text(
                      model.title!,
                      style: AppTheme.getTextStyle(
                        fontSize: AppSize.s18,
                        fontWeight: 800,
                        color: themeData.colorScheme.primary,
                      ),
                    ),
                  ),
                  verticalSpace(AppSize.s8!),
                  Text(
                    model.desc!,
                    style: AppTheme.getTextStyle(
                      fontSize: AppSize.s12,
                      fontWeight: 700,
                      color: themeData.colorScheme.onPrimary.withOpacity(.6),
                    ),
                  ),
                  verticalSpace(AppSize.s10!),
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
                    width: AppSize.screenWidth / 4,
                    borderWidth: 1,
                    borderColor: themeData.colorScheme.background,
                    settings: RestrictedPositions(
                      maxCoverage: 0.5,
                      minCoverage: 0.1,
                      align: StackAlign.right,
                      laying: StackLaying.last,
                      infoIndent: 10,
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
                        model.date!,
                        style: AppTheme.getTextStyle(
                          fontSize: AppSize.s12,
                          fontWeight: 700,
                          color:
                              themeData.colorScheme.onPrimary.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: HeroWidget(
                  tag: model.percent!.toString(),
                  child: CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 10.0,
                    animation: true,
                    animationDuration: 1200,
                    percent: model.percent! / 100,
                    center: Text(
                      "${model.percent!.toInt()}%",
                      style: AppTheme.getTextStyle(
                        fontSize: AppSize.s16,
                        fontWeight: 800,
                        color: themeData.colorScheme.primary,
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: model.color!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
