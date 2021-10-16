import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/auth/services/login.service.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';
import 'package:fundl_app/coupon/models/coupon.model.dart';
import 'package:fundl_app/home/widgets/my_coupons.widget.dart';
import 'package:fundl_app/profile/widgets/account_header.widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _handleLogout(BuildContext context) {
    LoginService.logout();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FutureBuilder<User>(
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
            ),
            FutureBuilder<List<Coupon>>(
              future: Coupon.getCoupons(),
              builder: (context, snapshot) {
                final coupons = snapshot.data;
                return MyCoupons(
                  coupons: coupons ?? [],
                );
              },
            ),
            // const ActionMenu(),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextIconButton(
                text: 'Logout',
                icon: IconlyLight.logout,
                onClick: () => _handleLogout(context),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
