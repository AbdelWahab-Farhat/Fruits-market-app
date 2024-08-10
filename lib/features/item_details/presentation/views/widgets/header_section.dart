import 'package:flutter/material.dart';

import 'app_bar_tools.dart';
import 'custom_item_image.dart';
import 'custom_page_ind.dart';
import 'image_shadow_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return  Stack(
      children: [
        const CustomItemImage(),
        const ImageShadowWidget(),
        const AppBarTools(),
        CustomPageInd(controller: controller),
      ],
    );
  }
}

