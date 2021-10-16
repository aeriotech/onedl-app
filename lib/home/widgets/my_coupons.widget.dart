import 'package:flutter/material.dart';
import 'package:fundl_app/common/widgets/coupon.widget.dart';
import 'package:fundl_app/coupon/models/coupon.model.dart';
import 'package:fundl_app/home/widgets/card_header.widget.dart';

class MyCoupons extends StatelessWidget {
  const MyCoupons({
    Key? key,
    required this.coupons,
  }) : super(key: key);

  final List<Coupon> coupons;

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
            color: Theme.of(context).colorScheme.background,
            showViewAll: false,
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            height: 250.0,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: coupons
                  .map(
                    (coupon) => CouponWidget.fromCoupon(coupon),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
