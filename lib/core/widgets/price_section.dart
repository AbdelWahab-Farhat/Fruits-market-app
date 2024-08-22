import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/widgets/quantity_widget.dart';

import '../../constants.dart';
import '../../features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';
import '../utility/app_style.dart';


class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var item = context.read<ItemDetailsCubit>().item;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$${item.price}',style: AppStyle.style24.copyWith(color: kLightYellow),),
        const QuantityWidget()
      ],
    );
  }
}


