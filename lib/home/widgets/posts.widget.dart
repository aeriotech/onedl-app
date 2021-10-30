import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/post.model.dart';
import 'package:fundl_app/common/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'post.widget.dart';

class Posts extends StatelessWidget {
  Posts({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _nextPage() {
    _currentPage < posts.length - 1 ? _currentPage++ : _currentPage = 0;
    try {
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 7),
      (timer) => _nextPage(),
    );

    return Visibility(
      visible: posts.isNotEmpty,
      child: Column(
        children: [
          SizedBox(
            height: 350.0,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) => _currentPage = page,
              itemCount: posts.length,
              itemBuilder: (context, i) {
                final post = posts[i];
                return PostWidget(
                  url: post.url,
                  imageUrl: post.image.url,
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: posts.length,
            effect: const WormEffect(
              activeDotColor: AppTheme.orange,
              dotHeight: 8.0,
              dotWidth: 8.0,
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
