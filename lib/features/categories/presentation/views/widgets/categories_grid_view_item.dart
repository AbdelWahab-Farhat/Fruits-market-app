import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/category_item.dart';
import '../../../../../core/utility/app_style.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem({
    super.key,
    required this.categoryItem,
  });

  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text('88 Items',style: AppStyle.style14.copyWith(color: kOrange,fontWeight: FontWeight.bold),)
          ],
        )
    );
  }
}
