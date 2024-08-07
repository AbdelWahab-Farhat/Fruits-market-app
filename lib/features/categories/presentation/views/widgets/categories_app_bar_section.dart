import 'package:flutter/material.dart';

import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';
import '../../../../../core/widgets/custom_pop_arrow.dart';


class CategoriesAppBarSection extends StatelessWidget implements PreferredSizeWidget{
  const CategoriesAppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      shadowColor: Colors.black,
      title: Text('Categories',style: AppStyle.style20,),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: const CustomPopArrow(color: Colors.black),
    );
  }

  @override
  Size get preferredSize =>  Size(SizeConfig.viewWidth! , kToolbarHeight);
}
