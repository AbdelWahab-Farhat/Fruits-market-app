import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/widgets/custom_cached_image.dart';

import '../../../../../core/utility/size_config.dart';

class ImageShadowWidget extends StatelessWidget {
  final String imageURL;
  const ImageShadowWidget({
    super.key, required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * 0.35,
      child: Stack(
        children: [
          SizedBox(
              width: SizeConfig.viewWidth,
              height: SizeConfig.viewHeight! * 0.35,
              child: CustomCachedImage(imageURL: imageURL)),
          Container(
            width: SizeConfig.viewWidth,
            height: SizeConfig.viewHeight! * 0.35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),  // Increased opacity for visibility
                  Colors.transparent,             // Transparent color to fade out
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}