import 'package:flutter/material.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/common/theme.dart';
import 'package:fundl_app/common/widgets/rating.widget.dart';
import 'package:marquee/marquee.dart';

class Coupon extends StatelessWidget {
  const Coupon({Key? key, required this.title}) : super(key: key);

  final String title;

  BoxDecoration get _imageDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(7.0, 1.0),
            blurRadius: 14.0,
            color: Color.fromRGBO(100, 100, 100, 0.30),
          ),
        ],
      );

  TextStyle get _titleStyle => const TextStyle(
        color: AppTheme.darkGrey,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        width: 130.0,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: _imageDecoration,
              child: Image.asset(
                AppAssets.placeholderPhone,
              ),
            ),
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
            const RatingBar(
              rating: 4.5,
              count: 324,
            ),
          ],
        ),
      ),
    );
  }
}
