import 'package:flutter/material.dart';

import '../../../../../core/utility/size_config.dart';


class CustomItemImage extends StatelessWidget {
  const CustomItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeConfig.viewWidth,
        height: SizeConfig.viewHeight! * 0.35,
        child: Image.asset('lib/assets/images/orange-photo.png',fit: BoxFit.cover,));
  }
}

