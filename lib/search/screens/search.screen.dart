import 'package:flutter/material.dart';
import 'package:fundl_app/search/widgets/category_list.widget.dart';
import 'package:fundl_app/search/widgets/shop_list.widget.dart';
import 'package:fundl_app/search/widgets/sort_by.widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

final tempCategories = [
  '🎉  Party',
  '🏕  Camp',
  '⛱  Beach',
];

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: SortByWidget(sortBy: SortBy.category),
          ),
          CategoryList(
            categories: tempCategories,
          ),
          const ShopList(),
        ],
      ),
    );
  }
}
