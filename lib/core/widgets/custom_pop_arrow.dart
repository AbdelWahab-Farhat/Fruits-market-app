import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomPopArrow extends StatelessWidget {
  final Color color;
  const CustomPopArrow({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => GoRouter.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: color,
          size: 30,
        ));
  }
}
