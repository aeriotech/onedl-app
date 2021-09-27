import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fundl_app/search/widgets/category_chip.widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key, required this.categories}) : super(key: key);

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SizedBox(
        height: 45.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, i) {
            return AnimationConfiguration.staggeredList(
              delay: const Duration(milliseconds: 50),
              position: i,
              child: ScaleAnimation(
                child: CategoryChip(
                  text: categories[i],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
