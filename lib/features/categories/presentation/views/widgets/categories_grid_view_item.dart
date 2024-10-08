import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/item.dart';
import '../../../../../core/utility/app_style.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem({
    super.key,
    required this.itemsByCategory,
  });
  final List<Item> itemsByCategory;
  @override
  Widget build(BuildContext context) {
    var categoryItem = itemsByCategory.first.category;
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.categoryView,extra: itemsByCategory),
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(top: 22,bottom: 5),
          width:95,
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
          child: Column(
            children: [
              SvgPicture.asset(
                categoryItem.imageUrl,
              ),
              const SizedBox(height: 10,),
              Text(categoryItem.name,style: AppStyle.style20.copyWith(color: kOrange),),
              Text('${itemsByCategory.length} Items',style: AppStyle.style14.copyWith(color: kOrange,fontWeight: FontWeight.bold),)
            ],
          )
      ),
    );
  }
}
