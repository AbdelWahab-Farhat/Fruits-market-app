import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class QuantityCart extends StatelessWidget {
  const QuantityCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          // onTap: itemDetailsCubit.quantityDecrement,
          child: const Icon(
            Icons.remove,
            size: 30,
            color: kLightYellow,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
            width: 40,
            child: Text(
              0.0.toString(),
              // itemDetailsCubit.quantity.toString(),
              style: AppStyle.style20.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )),
        const SizedBox(width: 10),
        GestureDetector(
          // onTap: itemDetailsCubit.quantityIncrement,
          child: const Icon(
            Icons.add,
            size: 30,
            color: kLightYellow,
          ),
        ),
      ],
    );
  }
}
