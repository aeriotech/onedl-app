import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/auth/screens/age_confirmation.screen.dart';
import 'package:fundl_app/common/models/category.model.dart';
import 'package:fundl_app/common/widgets/back_button.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';
import 'package:fundl_app/coupon/screens/coupon.screen.dart';
import 'package:fundl_app/daily/models/daily.model.dart';
import 'package:fundl_app/daily/dtos/daily_discount.dto.dart';
import 'package:fundl_app/daily/widgets/denied_dialog.widget.dart';
import 'package:fundl_app/daily/widgets/prize_dialog.widget.dart';
import 'package:fundl_app/daily/widgets/wheel.widget.dart';

class WheelDailyScreen extends StatefulWidget {
  static const routeName = '/daily';

  const WheelDailyScreen({Key? key}) : super(key: key);

  @override
  State<WheelDailyScreen> createState() => _WheelDailyScreenState();
}

class _WheelDailyScreenState extends State<WheelDailyScreen> {
  final _spinController = StreamController<int>();
  final _confettiController = ConfettiController();

  Daily? _daily;
  List<Category>? _categories;

  late final DailyDiscountDto _claimedDiscount;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  void _fetchData() async {
    final dailyList = await Daily.getDailyList();
    if (dailyList.isEmpty) {
      return;
    }

    setState(() {
      _daily = dailyList.first;
    });

    final user = await User.me();

    if (!user.ageConfirmed) {
      Navigator.of(context).pushReplacementNamed(AgeConfirmationScreen.routeName);
    }

    final availableDto = await Daily.isAvailable(_daily!.uuid);
    if (!availableDto.available) {
      _showDenyDialog(context);
    }
  }

  void _showDenyDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const DeniedDialog(),
    );
    Navigator.of(context).pop();
  }

  void _handleBack(BuildContext context) => Navigator.of(context).pop();

  void _onSpin(BuildContext context) async {
    _spinController.add(0);
    _claimedDiscount = await Daily.claimDailyDiscount(_daily!.uuid);

    final categoryIndex = _categories!.indexWhere(
      (category) => category.uuid == _claimedDiscount.discount.categoryUuid,
    );
    _spinController.add(categoryIndex);
  }

  void _onEnd(BuildContext context) async {
    _confettiController.play();
    await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => PrizeDialog(
        title: _claimedDiscount.title ?? '',
        description: _claimedDiscount.description ?? '',
        imageUrl: _claimedDiscount.image?.url,
      ),
    );
    Navigator.of(context).pushReplacementNamed(
      DiscountScreen.routeName,
      arguments: DiscountScreenArguments(
        uuid: _claimedDiscount.discount.uuid,
      ),
    );
  }

  Widget _buildSpinButton(BuildContext context) => TextIconButton(
        text: 'Zavrti kolo',
        icon: IconlyLight.arrowRight,
        onClick: () => _onSpin(context),
      );

  Widget get _wheel => FutureBuilder<List<Category>>(
      future: Daily.getDailyCategories(_daily!.uuid),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        _categories = snapshot.data!;
        return Wheel(
          onSpin: () => _onSpin(context),
          onEnd: () => _onEnd(context),
          spinController: _spinController,
          categories: _categories!,
        );
      });

  TextStyle get _comingSoonStyle => const TextStyle(
        fontSize: 28.0,
      );

  Widget _buildComingSoon(BuildContext context) => Stack(
        children: [
          Center(
            child: Text(
              'Coming Soon!',
              style: _comingSoonStyle,
            ),
          ),
          ScreenBackButton(
            onClick: () => _handleBack(context),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _daily != null
          ? Padding(
              padding: const EdgeInsets.all(0.0),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: _daily!.background!.url,
                    fit: BoxFit.cover,
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 64.0,
                  //     vertical: 150.0,
                  //   ),
                  //   child: _buildSpinButton(context),
                  // ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _wheel,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      numberOfParticles: 50,
                      maxBlastForce: 50,
                    ),
                  ),
                  ScreenBackButton(
                    onClick: () => _handleBack(context),
                  ),
                ],
              ),
            )
          : _buildComingSoon(context),
    );
  }
}
