import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/Skins/skins_shoes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adom/ui/screen/Skins/skins_screen.dart';
import 'package:adom/ui/screen/home_screen.dart';
import 'package:adom/ui/screen/Account/account_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'Account/account_edit_login_info.dart';
import 'Account/account_edit_profile.dart';
import 'commons/my_flutter_app_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<State<StatefulWidget>> accountKey = GlobalKey();

  List<Widget> _buildScreens() {
    return [
      const HomeWidget(),
      const SkinsWidget(),
      AccountWidget(key: accountKey),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(MyFlutterApp.home),
        title: ("Home"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MyFlutterApp.skins),
        title: ("Skins"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/shoes": (final context) => const SkinsShoes(),
            "/second": (final context) => const AccountEditProfile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MyFlutterApp.account),
        title: ("Account"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const AccountEditLoginInfo(),
            "/second": (final context) => const AccountEditProfile(),
          },
        ),
      ),
    ];
  }

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      popAllScreensOnTapAnyTabs: true,
      controller: _controller,
      onItemSelected: (value) {
        if (value == 2) {
          if (accountKey.currentState != null) {
            accountKey.currentState!.setState(() {});
          }
        }
      },
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      stateManagement: false,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      // screenTransitionAnimation: ScreenTransitionAnimation(
      //   // Screen transition animation on change of selected tab.
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: Duration(milliseconds: 200),
      // ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
