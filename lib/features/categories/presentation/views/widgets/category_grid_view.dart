import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_grid_view_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double axisSpacing = 20;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: axisSpacing,
        mainAxisSpacing: axisSpacing,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const CustomGridViewItem();
      },
    );
  }
}
