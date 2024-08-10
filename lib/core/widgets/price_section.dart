import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/widgets/quantity_widget.dart';

import '../../constants.dart';
import '../utility/app_style.dart';


class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$4.9',style: AppStyle.style24.copyWith(color: kLightYellow),),
        const QuantityWidget()
      ],
    );
  }
}


