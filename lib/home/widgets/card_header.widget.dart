import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/theme.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
    required this.title,
    this.color = Colors.white,
    this.onClick,
    this.showViewAll = true,
  }) : super(key: key);

  final String title;
  final Color color;
  final VoidCallback? onClick;
  final bool showViewAll;

  Color _viewAllColor(bool light) => light ? Colors.white.withOpacity(0.8) : AppTheme.grey;

  TextStyle _topDealsStyle(bool light) => TextStyle(
        fontSize: 18.0,
        color: light ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      );

  TextStyle _viewAllStyle(bool light) => TextStyle(
        fontSize: 14.0,
        color: _viewAllColor(light),
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    final light = color.computeLuminance() < 0.5;
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
            style: _topDealsStyle(light),
          ),
          const Spacer(),
          Visibility(
            visible: showViewAll,
            child: GestureDetector(
              onTap: onClick,
              child: Row(
                children: [
                  Text(
                    'View all',
                    style: _viewAllStyle(light),
                  ),
                  Icon(
                    IconlyLight.arrowRight,
                    color: _viewAllColor(light),
                    size: 18.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
