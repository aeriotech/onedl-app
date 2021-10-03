import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

import 'navigation_bar.widget.dart';

class Pages extends StatelessWidget {
  Pages({
    Key? key,
    required this.pages,
  }) : super(key: key);

  final List<PageItem> pages;

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final screens = pages.map((page) => page.screen).toList();
    final icons = pages.map((page) => page.icon).toList();
    final lables = pages.map((page) => page.label).toList();
    final badges = pages.map((page) => page.badge).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        controller: _controller,
        icons: icons,
        labels: lables,
        badges: badges,
      ),
    );
  }
}

class PageItem {
  final Widget screen;
  final String label;
  final IconData icon;
  final MotionBadgeWidget badge;

  const PageItem({
    required this.screen,
    required this.label,
    required this.icon,
    required this.badge,
  });
}
