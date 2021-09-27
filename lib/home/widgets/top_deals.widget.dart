import 'package:flutter/material.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/coupon/screens/coupon.screen.dart';
import 'package:fundl_app/home/widgets/card_header.widget.dart';

class TopDeals extends StatelessWidget {
  const TopDeals({Key? key}) : super(key: key);

  void _handleViewAll() {}

  void _handleOpen(BuildContext context) {
    Navigator.of(context).pushNamed(CouponScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.0,
          color: Theme.of(context).colorScheme.primary,
        ),
        Column(
          children: [
            CardHeader(
              title: '🔥  Top Deals',
              light: true,
              onClick: _handleViewAll,
            ),
            SizedBox(
              height: 250.0,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () => _handleOpen(context),
                    child: Image.asset(AppAssets.placeholderWolt),
                  ),
                  GestureDetector(
                    onTap: () => _handleOpen(context),
                    child: Image.asset(AppAssets.placeholderMcFundl),
                  ),
                  GestureDetector(
                    onTap: () => _handleOpen(context),
                    child: Image.asset(AppAssets.placeholderWolt),
                  ),
                  GestureDetector(
                    onTap: () => _handleOpen(context),
                    child: Image.asset(AppAssets.placeholderMcFundl),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ],
    );
  }
}
