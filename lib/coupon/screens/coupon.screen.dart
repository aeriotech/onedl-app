import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundl_app/api/exceptions/api/age_limit.exception.dart';
import 'package:fundl_app/api/exceptions/api/coupon_limit.exception.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/auth/screens/age_confirmation.screen.dart';
import 'package:fundl_app/common/widgets/back_button.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';
import 'package:fundl_app/coupon/models/coupon.model.dart';
import 'package:fundl_app/utils/snackbar.utils.dart';
import 'package:fundl_app/utils/url.utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CouponScreenArguments {
  CouponScreenArguments({required this.uuid});
  final String uuid;
}

class DiscountScreen extends StatelessWidget {
  static const routeName = '/discounts';

  const DiscountScreen({Key? key}) : super(key: key);

  TextStyle get _nameStyle => const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      );

  void _handleBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _handleClick(
    BuildContext context,
    Discount discount, [
    Coupon? coupon,
    Function(Coupon)? callback,
  ]) {
    switch (discount.couponType) {
      case CouponType.code:
        if (coupon == null) {
          _generateCoupon(context, discount, callback);
        } else {
          _copyCoupon(context, coupon);
        }
        break;
      case CouponType.url:
        if (coupon != null) {
          _openUrl(context, coupon);
        }
        break;
    }
  }

  void _generateCoupon(BuildContext context, Discount discount, Function(Coupon)? callback) async {
    try {
      final coupon = await discount.generate();
      if (callback != null) {
        callback(coupon);
      }
    } on AgeLimitException {
      Navigator.of(context).pushNamed(AgeConfirmationScreen.routeName);
    } on CouponLimitException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You can\'t claim any more coupons'),
        ),
      );
    }
  }

  void _copyCoupon(BuildContext context, Coupon coupon) async {
    await Clipboard.setData(ClipboardData(text: coupon.code));
    showSnackBar(context, 'Copied to clipboard');
  }

  void _showError(BuildContext context, bool http) {
    if (http) {
      showSnackBar(context, 'There was an error opening the website');
    } else {
      showSnackBar(context, 'Please install the app');
    }
  }

  void _openUrl(BuildContext context, Coupon coupon) async {
    final httpSchema = isHttp(coupon.code);
    if (Platform.isAndroid) {
      try {
        final intent = AndroidIntent(
          action: 'action_view',
          data: coupon.code,
        );
        await intent.launch();
      } catch (e) {
        _showError(context, httpSchema);
      }
    } else if (Platform.isIOS) {
      if (await canLaunch(coupon.code)) {
        await launch(coupon.code);
      } else {
        _showError(context, httpSchema);
      }
    } else {
      showSnackBar(context, 'Unsupported platform');
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
                ScreenBackButton(
                  color: Colors.black,
                  onClick: () => _handleBack(context),
                ),
                if (discount.shop!.logo != null)
                  Positioned(
                    top: 50.0,
                    left: 50.0,
                    child: CachedNetworkImage(
                      imageUrl: discount.shop!.logo!.url,
                      height: 50.0,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      const Spacer(),
                      CachedNetworkImage(
                        height: 400.0,
                        imageUrl: discount.image.url,
                        placeholder: (context, url) => const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                          height: 400.0,
                        ),
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
                      FutureBuilder<List<Coupon>>(
                        future: Coupon.getCoupons(),
                        builder: (context, snapshot) {
                          final coupons = snapshot.data;

                          if (coupons == null) {
                            return TextIconButton(
                              text: _buildButtonText(discount),
                            );
                          }

                          final filtered = coupons.where((coupon) => coupon.discountUuid == discount.uuid).toList();

                          String buttonText = _buildButtonText(discount);

                          Coupon? coupon = filtered.isNotEmpty ? filtered.first : null;

                          return StatefulBuilder(
                            builder: (context, setState) {
                              switch (discount.couponType) {
                                case CouponType.code:
                                  buttonText = coupon?.code ?? _buildButtonText(discount);
                                  break;

                                case CouponType.url:
                                  break;
                              }
                              return TextIconButton(
                                text: buttonText.toUpperCase(),
                                icon: IconlyLight.arrowRight,
                                onClick: () => _handleClick(
                                  context,
                                  discount,
                                  coupon,
                                  (c) => setState(() => coupon = c),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 30.0),
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
