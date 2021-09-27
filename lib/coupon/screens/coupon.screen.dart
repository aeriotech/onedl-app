import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class CouponScreen extends StatelessWidget {
  static const routeName = '/coupon';

  const CouponScreen({Key? key}) : super(key: key);

  TextStyle get _nameStyle => const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      );

  void _handleClick(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 50.0,
              left: 50.0,
              child: Image.asset(
                AppAssets.placeholderLogo,
                height: 50.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(AppAssets.placeholderCoupon),
                  Text(
                    'McFundl meni',
                    style: _nameStyle,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Popust vnovčiš z McDonald’s App-om. McFundl meni najdeš med “Kuponi”, izbereš meni in unovčiš popust.',
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  TextIconButton(
                    text: 'McDonald\'s app'.toUpperCase(),
                    icon: IconlyLight.arrowRight,
                    onClick: () => _handleClick(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
