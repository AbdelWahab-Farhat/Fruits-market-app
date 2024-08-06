import 'package:flutter/material.dart';

import '../../../../../core/models/category_item.dart';
import '../../../../../core/utility/size_config.dart';
import 'category_item_section.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const categories = CategoryItem.allItems;
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: SizeConfig.viewWidth,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) =>  CategoryItemSection(category: categories[index],),
      ),
    );
  }
}
