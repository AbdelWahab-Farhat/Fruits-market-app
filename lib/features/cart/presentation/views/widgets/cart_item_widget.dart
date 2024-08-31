import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../core/utility/size_config.dart';
import '../../../data/models/cart.dart';
import 'info_coulmn_with_total_price.dart';
import 'item_image_price.dart';
import 'quantity_cart.dart';

class CartItemWidget extends StatelessWidget {
  final Cart cartItem;
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          extentRatio: 1/5,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => cartItem.removeItem(context),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
              icon: Icons.delete,
              backgroundColor: Colors.black,
            ),
          ]),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        width: SizeConfig.viewWidth,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        height: 137,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemImagePrice(cartItem: cartItem,),
            InfoColumnWithTotalPrice(cartItem: cartItem,),
            const Spacer(),
             Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                QuantityCart(item: cartItem,),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
