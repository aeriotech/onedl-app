import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/daily/screens/wheel.screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  void _handleOnOpenGames(BuildContext context) {
    Navigator.of(context).pushNamed(WheelDailyScreen.routeName);
  }

  TextStyle get _textStyle => const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  String get _prompt {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  Widget _buildGameButton(BuildContext context) => GestureDetector(
        child: const Icon(IconlyLight.game),
        onTap: () => _handleOnOpenGames(context),
      );

  Widget get _logo => SvgPicture.asset(AppAssets.textLogo);

  Widget _buildHeader(BuildContext context) => SizedBox(
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: _buildGameButton(context),
              ),
              Align(
                alignment: Alignment.center,
                child: _logo,
              ),
            ],
          ),
        ),
      );

  Widget get _banner => Container(
        height: 42.0,
        color: Colors.blue,
        child: Center(
          child: Text(
            '$_prompt $name!',
            style: _textStyle,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(context),
        _banner,
      ],
    );
  }
}
