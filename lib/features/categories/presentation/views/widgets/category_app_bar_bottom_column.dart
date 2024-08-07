import 'package:flutter/material.dart';

import '../../../../../core/utility/app_style.dart';

class CategoryAppBarBottomColumn extends StatelessWidget {
  const CategoryAppBarBottomColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Fruits Category',style: AppStyle.style24.copyWith(color: Colors.white),),
        Text('87 Items',style: AppStyle.style16.copyWith(color: Colors.white ,fontWeight:FontWeight.normal),),
      ],
    );
  }
}
