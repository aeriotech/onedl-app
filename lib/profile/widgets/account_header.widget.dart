import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/common/theme.dart';
import 'package:fundl_app/profile/widgets/square_background.widget.dart';
import 'package:fundl_app/profile/widgets/curve_clipper.widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.name,
    required this.username,
    required this.friendCount,
    required this.coinCount,
  }) : super(key: key);

  final String name, username;
  final int friendCount, coinCount;

  // void _handleAdd() {}

  void _handleBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  TextStyle get _nameStyle => const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      );

  TextStyle get _usernameStyle => const TextStyle(
        fontSize: 15.0,
        color: AppTheme.darkGrey,
      );

  TextStyle get _friendsStyle => const TextStyle(
        fontSize: 15.0,
        color: AppTheme.darkGrey,
      );

  TextStyle get _coinsStyle => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
        color: AppTheme.darkGrey,
      );

  Widget get _avatar => Stack(
        alignment: Alignment.topRight,
        children: const [
          CircleAvatar(
            radius: 70.0,
            backgroundColor: AppTheme.lightGrey,
            backgroundImage: AssetImage(AppAssets.placeholderProfilePicture),
          ),
          // Positioned(
          //   top: 5.0,
          //   right: 5.0,
          //   child: GestureDetector(
          //     onTap: _handleAdd,
          //     child: const CircleAvatar(
          //       backgroundColor: Colors.white,
          //       child: Icon(
          //         Icons.add,
          //         color: Colors.black,
          //       ),
          //       radius: 16.0,
          //     ),
          //   ),
          // ),
        ],
      );

  Widget get _info => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$friendCount friends', style: _friendsStyle),
          const SizedBox(width: 5.0),
          const Icon(
            Icons.circle,
            size: 5.0,
          ),
          const SizedBox(width: 5.0),
          Text(
            '$coinCount fundl coins',
            style: _coinsStyle,
          ),
        ],
      );

  Widget get _divider => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Divider(thickness: 2.0),
      );

  Widget get _topLogo => Container(
        height: 200.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.textLogoWhiteSvg,
            ),
          ),
        ),
        decoration: const BoxDecoration(
          gradient: AppTheme.gradient,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: TopCurve(),
          child: _topLogo,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            _avatar,
            const SizedBox(height: 24.0),
            Text(
              name.toUpperCase(),
              style: _nameStyle,
            ),
            Text(
              '@$username',
              style: _usernameStyle,
            ),
            const SizedBox(height: 15.0),
            _info,
            const SizedBox(height: 15.0),
            _divider,
          ],
        ),
      ],
    );
  }
}
