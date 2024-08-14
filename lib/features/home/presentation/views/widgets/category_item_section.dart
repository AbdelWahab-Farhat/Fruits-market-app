import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/category_item.dart';
import '../../../../../core/models/item.dart';

class CategoryItemSection extends StatelessWidget {
  final CategoryItem category;
  final List<Item> items;
  const CategoryItemSection({
    super.key, required this.category, required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  GoRouter.of(context).push(AppRouter.categoryView,extra: itemsByCategory(items, category)),
      child: Container(
          margin: const EdgeInsets.only(left:28,bottom: 10),
          padding: const EdgeInsets.all(17),
          width:95,
          height: 65,
          decoration:  BoxDecoration(
              color: Colors.white,
              boxShadow:[
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(2, 4),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 4,
                    spreadRadius: 1
                ),
              ],
              borderRadius: BorderRadius.circular(18)
          ),
          child: SvgPicture.asset(
            category.imageUrl,
          )
      ),
    );
  }
}
