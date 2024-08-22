import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';

import '../utility/app_style.dart';


class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final item = context.read<ItemDetailsCubit>().item;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.category.name,style: AppStyle.style14.copyWith(fontWeight: FontWeight.w600,letterSpacing: 1.4),),
            Text(item.name,style: AppStyle.style24.copyWith(fontWeight: FontWeight.w500),)
          ],
        ),
      ],
    );
  }
}
