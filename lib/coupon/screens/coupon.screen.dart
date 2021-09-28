import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundl_app/api/models/coupon.model.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CouponScreenArguments {
  CouponScreenArguments({required this.uuid});
  final String uuid;
}

class CouponScreen extends StatelessWidget {
  static const routeName = '/coupon';

  const CouponScreen({Key? key}) : super(key: key);

  TextStyle get _nameStyle => const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      );

  void _handleClick(
    BuildContext context,
    Discount discount, [
    Coupon? coupon,
    Function(Coupon)? callback,
  ]) {
    switch (discount.couponType) {
      case CouponType.code:
        if (coupon == null) {
          _handleGenerateCoupon(discount, callback);
        }
        break;
      case CouponType.url:
        if (coupon != null) {
          _handleOpenUrl(context, coupon);
        }
        break;
    }
    // Navigator.of(context).pop();
  }

  void _handleGenerateCoupon(Discount discount, Function(Coupon)? callback) async {
    final coupon = await discount.generate();
    if (callback != null) {
      callback(coupon);
    }
  }

  void _handleOpenUrl(BuildContext context, Coupon coupon) async {
    if (await canLaunch(coupon.code)) {
      await launch(coupon.code);
    }
  }

  String _buildButtonText(Discount discount) {
    switch (discount.couponType) {
      case CouponType.code:
        return 'Generate';
      case CouponType.url:
        return 'Open';
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as CouponScreenArguments;

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Discount>(
          future: Discount.getDiscount(args.uuid),
          builder: (context, snapshot) {
            final discount = snapshot.data;

            if (discount == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Stack(
              children: [
                Positioned(
                  top: 50.0,
                  left: 50.0,
                  child: CachedNetworkImage(
                    imageUrl: discount.shop!.logo.url,
                    height: 50.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      const Spacer(),
                      CachedNetworkImage(
                        imageUrl: discount.image.url,
                      ),
                      Text(
                        discount.name,
                        style: _nameStyle,
                      ),
                      const SizedBox(height: 20.0),
                      MarkdownBody(
                        data: discount.description,
                        styleSheet: MarkdownStyleSheet(
                          textAlign: WrapAlignment.center,
                        ),
                      ),
                      const Spacer(),
                      StatefulBuilder(
                        builder: (context, setState) => FutureBuilder<List<Coupon>>(
                          future: Coupon.getCoupons(),
                          builder: (context, snapshot) {
                            final coupons = snapshot.data;

                            if (coupons == null) {
                              return TextIconButton(
                                text: _buildButtonText(discount).toUpperCase(),
                              );
                            }

                            final filtered = coupons.where((coupon) => coupon.discountUuid == discount.uuid).toList();

                            String buttonText;
                            switch (discount.couponType) {
                              case CouponType.code:
                                buttonText = filtered.isNotEmpty ? filtered.first.code : _buildButtonText(discount).toUpperCase();
                                break;

                              default:
                                buttonText = _buildButtonText(discount).toUpperCase();
                                break;
                            }

                            return TextIconButton(
                              text: buttonText,
                              icon: IconlyLight.arrowRight,
                              onClick: () => _handleClick(
                                context,
                                discount,
                                filtered.isNotEmpty ? filtered.first : null,
                                (coupon) => setState(() => buttonText = coupon.code),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
