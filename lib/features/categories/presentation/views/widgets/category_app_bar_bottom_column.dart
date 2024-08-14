import 'package:flutter/material.dart';

import '../../../../../core/models/item.dart';
import '../../../../../core/utility/app_style.dart';

class CategoryAppBarBottomColumn extends StatelessWidget {
  final List<Item> items;
  const CategoryAppBarBottomColumn({
    super.key, required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${items.first.category.name} Category',style: AppStyle.style24.copyWith(color: Colors.white),),
        Text("${items.length} Items",style: AppStyle.style16.copyWith(color: Colors.white ,fontWeight:FontWeight.normal),),
      ],
    );
  }
}
