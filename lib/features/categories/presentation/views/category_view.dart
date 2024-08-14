import 'package:flutter/material.dart';

import '../../../../core/models/item.dart';
import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  final List<Item> items;
  const CategoryView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return  CategoryViewBody(items: items,);
  }
}
