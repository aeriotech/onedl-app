import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/common/widgets/header.widget.dart';
import 'package:fundl_app/home/widgets/top_deals.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Header(),
        FutureBuilder<List<Discount>>(
          future: Discount.getDiscounts(),
          builder: (context, snapshot) {
            return TopDeals(
              discounts: snapshot.data ?? [],
              loading: snapshot.connectionState == ConnectionState.waiting,
            );
          },
        ),
        // const MyCoupons(),
      ],
    );
  }
}
