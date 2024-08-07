import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/size_config.dart';
import 'category_app_bar_bottom_column.dart';
import 'category_app_bar_top_row.dart';



class CategoryAppBarSection extends StatelessWidget {
  const CategoryAppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double side = 28;
    return Container(
      padding: const EdgeInsets.only(left: side,right: side , top: 50 ),
      width: SizeConfig.viewWidth,
      height: 222,
      decoration: const BoxDecoration(
          color:kLightYellow
      ),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryAppBarTopRow(),
          SizedBox(height: 32,),
          CategoryAppBarBottomColumn()
        ],
      ),
    );
  }
}
