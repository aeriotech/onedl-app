import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/coming_soon.model.dart';
import 'package:fundl_app/home/widgets/card_header.widget.dart';
import 'package:fundl_app/home/widgets/coming_soon_item.widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
    required this.comingSoon,
  }) : super(key: key);

  final List<ComingSoon> comingSoon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CardHeader(
          title: '💪  Prihaja kmalu',
          showViewAll: false,
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 130.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: comingSoon.length,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            itemBuilder: (context, i) => ComingSoonItem(comingSoon[i]),
          ),
        ),
      ],
    );
  }
}
