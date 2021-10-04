import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/coming_soon.model.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/api/models/post.model.dart';
import 'package:fundl_app/api/models/profile.model.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/common/widgets/header.widget.dart';
import 'package:fundl_app/home/widgets/coming_soon.widget.dart';
import 'package:fundl_app/home/widgets/posts.widget.dart';
import 'package:fundl_app/home/widgets/social.widget.dart';
import 'package:fundl_app/home/widgets/top_deals.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder<User>(
          future: User.me(),
          builder: (context, snapshot) {
            return Header(
              name: snapshot.data?.profile?.firstName ?? 'User',
            );
          },
        ),
        FutureBuilder<List<Post>>(
          future: Post.getPosts(),
          builder: (context, snapshot) {
            return Posts(
              posts: snapshot.data ?? [],
            );
          },
        ),
        FutureBuilder<List<Discount>>(
          future: Discount.getDiscounts(),
          builder: (context, snapshot) {
            return TopDeals(
              discounts: snapshot.data ?? [],
              loading: snapshot.connectionState == ConnectionState.waiting,
            );
          },
        ),
        FutureBuilder<List<ComingSoon>>(
          future: ComingSoon.getComingSoon(),
          builder: (context, snapshot) {
            return ComingSoonWidget(
              comingSoon: snapshot.data ?? [],
            );
          },
        ),

        const SizedBox(height: 50.0),
        // const MyCoupons(),
        const Social(),
        const SizedBox(height: 100.0),
      ],
    );
  }
}
