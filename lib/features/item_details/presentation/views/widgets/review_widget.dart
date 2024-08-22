import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../manger/item_details_cubit/item_details_cubit.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var item = context.read<ItemDetailsCubit>().item;
    var cubit = context.read<ItemDetailsCubit>();
    return Row(children: [
      const Icon(Icons.star,size: 30,color: kLightYellow,),
      const SizedBox(width: 5,),
      Text(cubit.calculateRate().toStringAsFixed(1),style: AppStyle.style18.copyWith(fontWeight: FontWeight.w600,color: Colors.black,)),
      const SizedBox(width: 9,),
      Text('(${item.reviews} reviews)',style: AppStyle.style14.copyWith(color: const Color(0xffAAAAAA)),)
    ],
    );
  }
}
