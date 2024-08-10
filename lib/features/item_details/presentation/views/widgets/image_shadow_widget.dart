import 'package:flutter/material.dart';

import '../../../../../core/utility/size_config.dart';

class ImageShadowWidget extends StatelessWidget {
  const ImageShadowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * 0.35,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.27) , Colors.grey.withOpacity(0.05)])
      ),
    );
  }
}