import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../data/models/cart.dart';
import '../../manger/cart_cubit/cart_cubit.dart';

class QuantityCart extends StatelessWidget {
  final Cart item;
  const QuantityCart({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.read<CartCubit>().quantityDecrement(item),
          child: const Icon(
            Icons.remove,
            size: 20,
            color: kLightYellow,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
            width: 40,
            child: Text(
              item.quantity.toString(),
              style: AppStyle.style20.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => context.read<CartCubit>().quantityIncrement(item),
          child: const Icon(
            Icons.add,
            size: 20,
            color: kLightYellow,
          ),
        ),
      ],
    );
  }
}
