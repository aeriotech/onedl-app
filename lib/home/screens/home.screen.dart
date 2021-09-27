import 'package:flutter/material.dart';
import 'package:fundl_app/common/widgets/header.widget.dart';
import 'package:fundl_app/home/widgets/my_coupons.widget.dart';
import 'package:fundl_app/home/widgets/top_deals.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Header(),
        TopDeals(),
        MyCoupons(),
      ],
    );
  }
}
