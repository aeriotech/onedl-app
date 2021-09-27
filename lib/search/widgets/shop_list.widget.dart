import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fundl_app/search/widgets/shop_card.widget.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimationLimiter(
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, i) {
              return AnimationConfiguration.staggeredGrid(
                position: i,
                columnCount: 3,
                delay: const Duration(milliseconds: 50),
                child: const ScaleAnimation(
                  child: ShopCard(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
