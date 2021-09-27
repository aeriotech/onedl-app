import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart' as r;
import 'package:fundl_app/common/theme.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({Key? key, required this.rating, this.count}) : super(key: key);

  final double rating;
  final int? count;

  TextStyle get _ratingTextStyle => const TextStyle(
        color: AppTheme.grey,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    final starColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        r.RatingBar(
          initialRating: rating,
          allowHalfRating: true,
          itemSize: 14.0,
          ratingWidget: r.RatingWidget(
            full: Icon(
              Icons.star_rounded,
              color: starColor,
            ),
            half: Icon(
              Icons.star_half_rounded,
              color: starColor,
            ),
            empty: Icon(
              Icons.star_border_rounded,
              color: starColor,
            ),
          ),
          onRatingUpdate: (value) {},
        ),
        const SizedBox(width: 10.0),
        Visibility(
          visible: count != null,
          child: Text(
            '($count)',
            style: _ratingTextStyle,
          ),
        )
      ],
    );
  }
}
