import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/home/screens/home.screen.dart';
import 'package:fundl_app/home/widgets/navigation_bar.widget.dart';
import 'package:fundl_app/search/screens/search.screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';

  MainScreen({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 0);

  final _icons = [
    IconlyBold.home,
    IconlyBold.notification,
    IconlyBold.location,
    IconlyBold.profile,
  ];

  final _screens = const [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        controller: _controller,
        icons: _icons,
      ),
    );
  }
}
