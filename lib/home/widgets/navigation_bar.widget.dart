import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({
    Key? key,
    required this.controller,
    required this.icons,
  }) : super(key: key);

  final List<IconData> icons;
  final PageController controller;

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;

  void _handleOnTap(int index) {
    widget.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        IconlyBold.home,
        IconlyBold.notification,
        IconlyBold.location,
        IconlyBold.profile,
      ],
      activeIndex: _currentIndex,
      onTap: _handleOnTap,
    );
  }
}
