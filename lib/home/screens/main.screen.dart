import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/chat/screens/chat.screen.dart';
import 'package:fundl_app/home/screens/home.screen.dart';
import 'package:fundl_app/home/widgets/navigation_bar.widget.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';

  MainScreen({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 0);

  final _labels = [
    'Home',
    'Chat',
  ];

  final _icons = [
    IconlyBold.home,
    IconlyBold.chat,
    // IconlyBold.notification,
    // IconlyBold.location,
    // IconlyBold.profile,
  ];

  final _screens = const [
    HomeScreen(),
    ChatScreen(),
    // SearchScreen(),
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
        labels: _labels,
      ),
    );
  }
}
