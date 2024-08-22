import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/widgets/image_shadow_widget.dart';

import '../../../../../core/models/item.dart';
import '../../../../../core/utility/size_config.dart';


class CustomItemImage extends StatelessWidget {
  final Item item;
  final PageController controller;
  const CustomItemImage({
    super.key,
    required this.controller, required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * 0.35,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children:  [
          ImageShadowWidget(imageURL: item.imageURL,),
          ImageShadowWidget(imageURL: item.imageURL,),
          ImageShadowWidget(imageURL: item.imageURL,),
        ],
      ),
    );
  }
}

