import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/common/theme.dart';
import 'package:fundl_app/coupon/screens/coupon.screen.dart';
import 'package:fundl_app/daily/models/daily.model.dart';
import 'package:fundl_app/daily/screens/wheel.screen.dart';
import 'package:fundl_app/home/widgets/card_header.widget.dart';

class TopDeals extends StatelessWidget {
  const TopDeals({
    Key? key,
    required this.discounts,
    required this.dailyList,
    this.loading = false,
  }) : super(key: key);

  final List<Discount> discounts;
  final List<Daily> dailyList;
  final bool loading;

  void _handleViewAll() {}

  void _handleOpen(BuildContext context, String uuid) {
    Navigator.of(context).pushNamed(
      DiscountScreen.routeName,
      arguments: DiscountScreenArguments(uuid: uuid),
    );
  }

  Widget _buildDaily(BuildContext context, int i) {
    final daily = dailyList[i];
    if (daily.thumbnail == null) {
      return const SizedBox(
        height: 200,
      );
    }
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(WheelDailyScreen.routeName),
      child: CachedNetworkImage(
        imageUrl: daily.thumbnail!.url,
      ),
    );
  }

  Widget _buildDiscount(BuildContext context, int i) {
    final discount = discounts[i - dailyList.length];
    if (discount.thumbnail == null) {
      return const SizedBox(
        height: 200,
      );
    }
    return GestureDetector(
      onTap: () => _handleOpen(context, discount.uuid),
      child: CachedNetworkImage(
        imageUrl: discount.thumbnail!.url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: discounts.isNotEmpty,
      child: Container(
        color: AppTheme.dirtyWhite,
        child: Column(
          children: [
            CardHeader(
              title: '🔥  Top deals',
              onClick: _handleViewAll,
              showViewAll: false,
              color: AppTheme.dirtyWhite,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 250.0,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: dailyList.length + discounts.length,
                itemBuilder: (context, i) => i <= dailyList.length - 1 ? _buildDaily(context, i) : _buildDiscount(context, i),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
