import 'package:flutter/material.dart';

import 'trending_item_section.dart';

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
        return const TrendingItemSection();
      },
    );
  }
}
