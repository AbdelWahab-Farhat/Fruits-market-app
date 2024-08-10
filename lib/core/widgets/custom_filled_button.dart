import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final void Function()? onTap;
  const CustomFilledButton(
      {super.key,
      this.color,
      this.width,
      this.height,
      required this.title,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(32);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? SizeConfig.viewWidth,
        height: height ?? 60,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color ?? kLightYellow,
        ),
        child: Center(
            child: Text(
          title,
          style: AppStyle.style16
              .copyWith(color: color != null ? Colors.white : null),
              textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
