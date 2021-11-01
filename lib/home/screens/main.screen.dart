import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/chat/screens/chat.screen.dart';
import 'package:fundl_app/home/screens/home.screen.dart';
import 'package:fundl_app/home/widgets/pages.widget.dart';
import 'package:fundl_app/profile/screens/profile.screen.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:upgrader/upgrader.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  final _pages = const [
    PageItem(
      screen: HomeScreen(),
      label: 'Home',
      icon: IconlyBold.home,
      badge: MotionBadgeWidget(),
    ),
    PageItem(
      screen: ChatScreen(),
      label: 'Chat',
      icon: IconlyBold.chat,
      badge: MotionBadgeWidget(),
    ),
    PageItem(
      screen: ProfileScreen(),
      label: 'Profile',
      icon: IconlyBold.profile,
      badge: MotionBadgeWidget(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Pages(
        pages: _pages,
      ),
    );
  }
}
