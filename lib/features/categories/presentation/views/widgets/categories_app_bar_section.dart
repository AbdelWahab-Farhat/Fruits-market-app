import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';

import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';


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
      backgroundColor: kLightYellow.withOpacity(0.35),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>  Size(SizeConfig.viewWidth! , kToolbarHeight);
}
