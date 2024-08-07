import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/size_config.dart';
import 'category_grid_view.dart';
import 'custom_search_bar.dart';


class CategorySearchSection extends StatelessWidget {
  const CategorySearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double topRadius = 33;
    return Positioned(
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! - 200,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(top: 27),
        decoration: const BoxDecoration(
          color: kLightWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRadius),
            topLeft: Radius.circular(topRadius),
          ),
        ),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomSearchBar(),
              CategoryGridView()
            ],
          ),
        ),
      ),
    );
  }
}
