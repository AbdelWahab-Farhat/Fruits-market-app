import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_pop_arrow.dart';

class CategoryAppBarTopRow extends StatelessWidget {
  const CategoryAppBarTopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomPopArrow(color: Colors.white),
        SvgPicture.asset('lib/assets/icons/filters-icon.svg')
      ],
    );
  }
}
