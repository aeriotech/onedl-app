import 'package:flutter/material.dart';
import 'package:fundl_app/api/models/post.model.dart';

import 'post.widget.dart';

class Posts extends StatelessWidget {
  const Posts({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: posts.isNotEmpty,
      child: SizedBox(
        height: 350.0,
        child: PageView.builder(
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
    );
  }
}
