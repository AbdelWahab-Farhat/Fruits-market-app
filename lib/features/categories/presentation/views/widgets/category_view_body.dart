import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';

import '../../../../../core/widgets/custom_grid_view_item.dart';
import 'category_app_bar_section.dart';
import 'category_search_section.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          height: SizeConfig.viewHeight,
          width: SizeConfig.viewWidth,
          child: const Stack(
            children: [
              CategoryAppBarSection(),
              CategorySearchSection(),
            ],
          ),
        ),
      ),
    );
  }
}



