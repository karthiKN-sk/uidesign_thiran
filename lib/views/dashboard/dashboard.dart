import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uidesign_thiran/views/task/taskpage.dart';

import '../home/homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const TaskPage(),
    const Center(child: Text("Add Task")),
    const Center(child: Text("Notification")),
    const Center(child: Text("Settings")),
  ];
  late PersistentTabController _controller;
  DateTime? currentBackPressTime;
  late ThemeData themeData;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tap Again to Exit");
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(
          Icons.home,
        ),
        activeColorPrimary: themeData.colorScheme.primary,
        inactiveColorPrimary: themeData.colorScheme.onInverseSurface,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.clipboardCheck),
        activeColorPrimary: themeData.colorScheme.primary,
        inactiveColorPrimary: themeData.colorScheme.onInverseSurface,
      ),
      PersistentBottomNavBarItem(
        onPressed: (p0) {},
        icon: Icon(
          Icons.add,
          color: themeData.colorScheme.background,
          size: 40,
        ),
        activeColorPrimary: themeData.colorScheme.primary,
        inactiveColorPrimary: themeData.colorScheme.background,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.bell),
        activeColorPrimary: themeData.colorScheme.primary,
        inactiveColorPrimary: themeData.colorScheme.onInverseSurface,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.gear),
        activeColorPrimary: themeData.colorScheme.primary,
        inactiveColorPrimary: themeData.colorScheme.onInverseSurface,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return WillPopScope(
      onWillPop: () async => await onWillPop(),
      child: SafeArea(
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: screens,
          items: _navBarsItems(),

          backgroundColor:
              themeData.colorScheme.background, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: themeData.colorScheme.primary,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.once,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style15, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}
