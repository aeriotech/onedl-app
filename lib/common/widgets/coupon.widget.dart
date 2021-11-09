import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/theme.dart';
import 'package:fundl_app/coupon/models/coupon.model.dart';
import 'package:fundl_app/coupon/screens/coupon.screen.dart';
import 'package:marquee/marquee.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    Key? key,
    required this.title,
    required this.discountUuid,
    required this.couponCode,
    this.imageUrl,
  }) : super(key: key);

  final String title, discountUuid, couponCode;
  final String? imageUrl;

  factory CouponWidget.fromCoupon(Coupon coupon) {
    final discount = coupon.discount;
    return CouponWidget(
      title: discount.name,
      discountUuid: discount.uuid,
      couponCode: coupon.code,
      imageUrl: discount.image?.url,
    );
  }

  void _handleTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      DiscountScreen.routeName,
      arguments: DiscountScreenArguments(
        uuid: discountUuid,
        couponCode: couponCode,
      ),
    );
  }

  TextStyle get _titleStyle => const TextStyle(
        color: AppTheme.darkGrey,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      );

  Widget get _image => SizedBox(
        width: 130.0,
        height: 130.0,
        child: imageUrl != null
            ? CachedNetworkImage(imageUrl: imageUrl!)
            : const Icon(
                IconlyLight.star,
                size: 60.0,
                color: AppTheme.orange,
              ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () => _handleTap(context),
        child: SizedBox(
          width: 130.0,
          child: Column(
            children: [
              _image,
              const SizedBox(height: 10.0),
              SizedBox(
                width: 130.0,
                height: 20.0,
                child: title.length <= 16
                    ? Text(
                        title,
                        style: _titleStyle,
                      )
                    : Marquee(
                        text: title,
                        blankSpace: 30.0,
                        velocity: 30.0,
                        fadingEdgeStartFraction: 0.1,
                        fadingEdgeEndFraction: 0.1,
                        style: _titleStyle,
                      ),
              ),
              // const RatingBar(
              //   rating: 4.5,
              //   count: 324,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
