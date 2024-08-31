import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/widgets/custom_cached_image.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../data/models/cart.dart';

class ItemImagePrice extends StatelessWidget {
  final Cart cartItem;
  const ItemImagePrice({
    super.key, required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                width: 120,
                height: 120,
                child: CustomCachedImage(imageURL: cartItem.imageURL)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: kLightYellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '\$ ${cartItem.price..toStringAsFixed(2)}',
                style: AppStyle.style16.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
