import 'package:flutter/material.dart';
import 'package:fundl_app/common/widgets/coupon.widget.dart';
import 'package:fundl_app/home/widgets/card_header.widget.dart';

class MyCoupons extends StatelessWidget {
  const MyCoupons({Key? key}) : super(key: key);

  void _handleViewAll() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          CardHeader(
            title: '💪  Moji Kuponi',
            onClick: _handleViewAll,
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            height: 250.0,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: const [
                Coupon(title: 'Testni kupon 1'),
                Coupon(title: 'Daljši testni kupon'),
                Coupon(title: 'Ta kupon je zelo velik, zato se mu besedilo premika'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
