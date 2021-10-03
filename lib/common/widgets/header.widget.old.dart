import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundl_app/common/assets.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  void _handleProfileClick(BuildContext context) {
    // Navigator.of(context).pushNamed(ProfileScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30.0,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.textLogo,
              height: 24.0,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => _handleProfileClick(context),
              child: const CircleAvatar(
                backgroundImage: AssetImage(AppAssets.placeholderProfilePicture),
                radius: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
