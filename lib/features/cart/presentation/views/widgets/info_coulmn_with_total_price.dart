import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../data/models/cart.dart';

class InfoColumnWithTotalPrice extends StatelessWidget {
  final Cart cartItem;
  const InfoColumnWithTotalPrice({
    super.key, required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.category.name,
          textAlign: TextAlign.start,
          softWrap: true,
          style: AppStyle.style14.copyWith(
              color: Colors.black.withOpacity(
                0.6,
              ),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 100,
          child: Text(
            cartItem.name,
            maxLines: 2,
            textAlign: TextAlign.start,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.style16,
          ),
        ),
        const Spacer(),
        Text(
          '\$ ${cartItem.totalPrice().toStringAsFixed(2)}',
          style: AppStyle.style18
              .copyWith(color: kOrange, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
