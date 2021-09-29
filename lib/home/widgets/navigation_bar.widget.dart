import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({
    Key? key,
    required this.labels,
    required this.controller,
    required this.icons,
  }) : super(key: key);

  final List<String> labels;
  final List<IconData> icons;
  final PageController controller;

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  void _handleOnTap(int index) {
    widget.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      icons: widget.icons,
      labels: widget.labels,
      initialSelectedTab: widget.labels.first,
      onTabItemSelected: _handleOnTap,
      badges: const [
        MotionBadgeWidget(),
        MotionBadgeWidget(
          isIndicator: true,
          size: 8.0,
        ),
      ],
    );
  }
}
