import 'package:flutter/material.dart';

import '../../../../../core/utility/size_config.dart';
import 'promo_item_section.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.viewWidth,
      height: 162,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 28 , bottom: 30),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        physics: const BouncingScrollPhysics(),
        itemBuilder:  (context, index) =>  const Padding(
          padding: EdgeInsets.only(right: 20),
          child: PromoItemSection(),
        ),
      ),
    );
  }
}
