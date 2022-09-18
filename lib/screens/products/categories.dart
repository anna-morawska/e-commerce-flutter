import 'package:flutter/material.dart';

import '../../screens/products/category_item.dart';

const categories = [
  "Trending now",
  "All",
  "Women",
  "Men",
  "Kids",
];

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryItem(
          categoryName: categories[index],
          isSelected: index == 0,
        ),
      ),
    );
  }
}
