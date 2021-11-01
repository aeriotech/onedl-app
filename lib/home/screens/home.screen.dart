import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/coming_soon.model.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/api/models/post.model.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/common/widgets/header.widget.dart';
import 'package:fundl_app/daily/models/daily.model.dart';
import 'package:fundl_app/home/widgets/coming_soon.widget.dart';
import 'package:fundl_app/home/widgets/posts.widget.dart';
import 'package:fundl_app/home/widgets/social.widget.dart';
import 'package:fundl_app/home/widgets/top_deals.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: FutureBuilder<User>(
            future: User.me(),
            builder: (context, snapshot) {
              return Header(
                name: snapshot.data?.profile?.firstName ?? '',
              );
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: [
              FutureBuilder<List<Post>>(
                future: Post.getPosts(),
                builder: (context, snapshot) {
                  return Posts(
                    posts: snapshot.data ?? [],
                  );
                },
              ),
              FutureBuilder<List<dynamic>>(
                future: Future.wait([
                  Discount.getDiscounts(),
                  Daily.getDailyList(),
                ]),
                builder: (context, snapshot) {
                  final List<Discount>? discounts = snapshot.data?.first as List<Discount>?;
                  final List<Daily>? dailyList = snapshot.data?.last as List<Daily>?;
                  discounts?.shuffle();
                  return TopDeals(
                    discounts: discounts ?? [],
                    dailyList: dailyList ?? [],
                    loading: snapshot.connectionState == ConnectionState.waiting,
                  );
                },
              ),
              FutureBuilder<List<ComingSoon>>(
                future: ComingSoon.getComingSoon(),
                builder: (context, snapshot) {
                  final comingSoon = snapshot.data ?? [];
                  comingSoon.shuffle();
                  return ComingSoonWidget(
                    comingSoon: comingSoon,
                  );
                },
              ),

              const SizedBox(height: 50.0),
              // const MyCoupons(),
              const Social(),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ],
    );
  }
}
