import 'package:flutter/material.dart';
import 'package:fundl_app/home/widgets/my_coupons.widget.dart';
import 'package:fundl_app/profile/widgets/account_header.widget.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ProfileHeader(
            name: 'Gašper Dobrovoljc',
            username: 'gasper',
            friendCount: 13,
            coinCount: 420,
          ),
          MyCoupons(),
        ],
      ),
    );
  }
}
