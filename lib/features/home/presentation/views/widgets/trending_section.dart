import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_grid_view_item.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const CustomGridViewItem();
      },
    );
  }
}
