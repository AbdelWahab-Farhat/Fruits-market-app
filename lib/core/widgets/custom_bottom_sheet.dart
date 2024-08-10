import 'package:flutter/material.dart';

import '../utility/size_config.dart';

class CustomBottomSheet extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget widget;
  const CustomBottomSheet({
    super.key, this.width, this.height, required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: width ?? SizeConfig.viewWidth,
        height: height ?? SizeConfig.viewHeight! * (1 - 0.32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        ),
        child: widget,
      ),
    );
  }
}
