import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/theme.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({Key? key, required this.title, this.onClick, this.light = false}) : super(key: key);

  final String title;
  final bool light;
  final VoidCallback? onClick;

  Color get _viewAllColor => light ? Colors.white.withOpacity(0.8) : AppTheme.grey;

  TextStyle get _topDealsStyle => TextStyle(
        fontSize: 18.0,
        color: light ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      );

  TextStyle get _viewAllStyle => TextStyle(
        fontSize: 14.0,
        color: _viewAllColor,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
        bottom: 5.0,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: _topDealsStyle,
          ),
          const Spacer(),
          GestureDetector(
            onTap: onClick,
            child: Row(
              children: [
                Text(
                  'View all',
                  style: _viewAllStyle,
                ),
                Icon(
                  IconlyLight.arrowRight2,
                  color: _viewAllColor,
                  size: 18.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
