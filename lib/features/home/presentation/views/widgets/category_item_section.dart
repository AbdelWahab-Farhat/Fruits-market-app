import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/enums/category_item.dart';

class CategoryItemSection extends StatelessWidget {
  final CategoryItem category;
  const CategoryItemSection({
    super.key, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
