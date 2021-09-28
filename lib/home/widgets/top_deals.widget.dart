import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/coupon/screens/coupon.screen.dart';
import 'package:fundl_app/home/widgets/card_header.widget.dart';

class TopDeals extends StatelessWidget {
  const TopDeals({
    Key? key,
    required this.discounts,
    this.loading = false,
  }) : super(key: key);

  final List<Discount> discounts;
  final bool loading;

  void _handleViewAll() {}

  void _handleOpen(BuildContext context, String uuid) {
    Navigator.of(context).pushNamed(
      CouponScreen.routeName,
      arguments: CouponScreenArguments(uuid: uuid),
    );
  }

  Widget _buildItem(BuildContext context, int i) {
    final discount = discounts[i];
    return GestureDetector(
      onTap: () => _handleOpen(context, discount.uuid),
      child: CachedNetworkImage(
        imageUrl: discount.thumbnail.url,
      ),
    );
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
              showViewAll: false,
            ),
            SizedBox(
              height: 250.0,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: discounts.length,
                itemBuilder: _buildItem,
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ],
    );
  }
}
