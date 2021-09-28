import 'package:flutter/material.dart';

enum SortBy {
  category,
  aToZ,
}

class SortByWidget extends StatelessWidget {
  const SortByWidget({
    Key? key,
    required this.sortBy,
    this.onSelect,
  }) : super(key: key);

  final SortBy sortBy;
  final Function(SortBy)? onSelect;

  TextStyle get _textStyle => const TextStyle(
        fontSize: 14.0,
      );

  Widget get _category {
    final sortByCategory = sortBy == SortBy.category;
    return Column(
      children: [
        Text(
          'Sort by category',
          style: sortByCategory
              ? _textStyle
              : _textStyle.copyWith(
                  color: Colors.grey,
                ),
        ),
        const SizedBox(height: 3.0),
        Visibility(
          visible: sortByCategory,
          child: const Icon(
            Icons.circle,
            size: 5.0,
          ),
        ),
      ],
    );
  }

  Widget get _aToZ {
    final sortFromAToZ = sortBy == SortBy.aToZ;
    return Column(
      children: [
        Text(
          'Sort from A to Z',
          style: sortFromAToZ
              ? _textStyle
              : _textStyle.copyWith(
                  color: Colors.grey,
                ),
        ),
        const SizedBox(height: 3.0),
        Visibility(
          visible: sortFromAToZ,
          child: const Icon(
            Icons.circle,
            size: 5.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _category,
        const SizedBox(width: 25.0),
        _aToZ,
      ],
    );
  }
}
