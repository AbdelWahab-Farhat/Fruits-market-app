import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 18;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: TextField(
        style: AppStyle.style16,
        maxLines: 1,
        decoration: InputDecoration(
            hintText: 'Search For An Item . .',
            hintStyle: AppStyle.style16.copyWith(color: Colors.grey),
            suffixIcon: const Icon(
              Icons.search_rounded,
              size: 28,
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kOrange),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)))),
      ),
    );
  }
}
