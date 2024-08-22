import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';
import '../utility/app_style.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var itemDetailsCubit = context.read<ItemDetailsCubit>();
    return BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: itemDetailsCubit.quantityDecrement,
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
                  itemDetailsCubit.quantity.toString(),
                  style: AppStyle.style20.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: itemDetailsCubit.quantityIncrement,
              child: const Icon(
                Icons.add,
                size: 30,
                color: kLightYellow,
              ),
            ),
          ],
        );
      },
    );
  }
}
