import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/categories/presentation/views/widgets/categories_grid_view_item.dart';

import '../../../../../core/models/category_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    const categories = CategoryItem.allItems;
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20 ,left: 28,right: 28),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.80
      ),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoriesGridViewItem(categoryItem: categories[index]);
      },
    );
  }
}

