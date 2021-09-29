import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/profile/widgets/account_header.widget.dart';
import 'package:fundl_app/profile/widgets/action_menu.widget.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<User>(
            future: User.me(),
            builder: (context, snapshot) {
              final user = snapshot.data;

              if (user == null) {
                return Container();
              }

              return ProfileHeader(
                name: '${user.profile?.firstName ?? ''} ${user.profile?.lastName ?? ''}',
                username: user.username,
                friendCount: 0,
                coinCount: user.score,
              );
            },
          ),
          // MyCoupons(),
          const ActionMenu(),
        ],
      ),
    );
  }
}
