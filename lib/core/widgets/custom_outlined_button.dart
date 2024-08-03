import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final void Function()? onTap;
  const CustomOutlinedButton(
      {super.key,
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
          border: Border.all(color: Colors.black),
          borderRadius: borderRadius,
          color: Colors.white,
        ),
        child: Center(
            child: Text(
              title,
              style: AppStyle.style16
                  .copyWith(color: Colors.black),
            )),
      ),
    );
  }
}
