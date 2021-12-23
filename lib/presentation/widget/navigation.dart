import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/page/home.dart';
import 'package:kokuchi_event/presentation/page/lets_go_list.dart';
import 'package:kokuchi_event/presentation/page/my_page.dart';
import 'package:kokuchi_event/presentation/page/post.dart';
import 'package:kokuchi_event/presentation/widget/home/body.dart';
import 'package:kokuchi_event/presentation/widget/lets_go_list/body.dart';
import 'package:kokuchi_event/presentation/widget/my_page/body.dart';
import 'package:kokuchi_event/presentation/widget/version_check/updator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Navigation extends StatelessWidget {
  const Navigation();

  static int _currentTab;

  @override
  Widget build(BuildContext context) {
    final _buildScreens = [
      const Home(),
      const Post(),
      const LetsGoList(),
      const MyPage(),
    ];

    final _navBarsItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'ホーム',
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: '投稿',
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.event_note),
        title: 'いきたい',
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: 'マイページ',
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
    ];

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    final backgroundColor = Theme.of(context).backgroundColor;

    return WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: [
            PersistentTabView(
              resizeToAvoidBottomInset: true,
              navBarHeight: 60,
              padding: const NavBarPadding.only(bottom: 10),
              backgroundColor: backgroundColor,
              controller: _controller,
              items: _navBarsItems,
              screens: _buildScreens,
//              showElevation: true,
              confineInSafeArea: true,
              handleAndroidBackButtonPress: true,
              iconSize: 25,
              navBarStyle: NavBarStyle.neumorphic,
              neumorphicProperties:
                  const NeumorphicProperties(curveType: CurveType.convex),
              onItemSelected: _selectedTab,
            ),
            const Updater(),
          ],
        ));
  }

  void _selectedTab(int index) {
    if (_currentTab == index &&
        index == 0 &&
        HomeBody.homeScrollController != null &&
        HomeBody.homeScrollController.hasClients) {
      HomeBody.homeScrollController.animateTo(
        0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }

    if ((_currentTab == index && index == 2) &&
        LetsGoListBody.letsGoScrollController != null &&
        LetsGoListBody.letsGoScrollController.hasClients) {
      LetsGoListBody.letsGoScrollController.animateTo(
        0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }

    if ((_currentTab == index && index == 3) &&
        MyPageBody.myPageScrollController != null &&
        MyPageBody.myPageScrollController.hasClients) {
      MyPageBody.myPageScrollController.animateTo(
        0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }

    _currentTab = index;
  }
}
