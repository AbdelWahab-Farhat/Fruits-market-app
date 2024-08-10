import 'package:flutter/material.dart';

import '../utility/app_style.dart';


class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fruits',style: AppStyle.style14.copyWith(fontWeight: FontWeight.w600,letterSpacing: 1.4),),
            Text('Fresh Orange',style: AppStyle.style24.copyWith(fontWeight: FontWeight.w500),)
          ],
        ),
        const Icon(Icons.favorite_border,size: 30,)
      ],
    );
  }
}
