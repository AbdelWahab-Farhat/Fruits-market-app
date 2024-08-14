import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;

  const CustomErrorWidget({
    super.key,
    required this.errMessage,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        color: Colors.red,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            errMessage,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}