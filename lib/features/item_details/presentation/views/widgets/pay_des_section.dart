import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/helper.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/widgets/custom_outlined_button.dart';
import '../../../../auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import '../../manger/item_details_cubit/item_details_cubit.dart';

class PayDesSection extends StatelessWidget {
  const PayDesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var itemCubit = context.read<ItemDetailsCubit>();
    var signInCubit = context.read<SignInCubit>();
    return BlocConsumer<ItemDetailsCubit, ItemDetailsState>(
      listener: (context, state) {
        if (state is ItemDetailsSuccess) {
          showTopSnackBar(context, "Item Added To Cart Successfully");
          GoRouter.of(context).pop();
        }
        if (state is ItemDetailsFailed) {
          showTopSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is ItemDetailsLoading) {
          return const CustomLoadingWidget();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              itemCubit.item.description!,
              style: AppStyle.style14,
              maxLines: 4,
            ),
            const Spacer(),
            CustomOutlinedButton(
              title: 'Payment\n \$${(itemCubit.item.price * itemCubit.quantity).toStringAsFixed(2)}',
              onTap: () async {
                await itemCubit.addItemToCart(signInCubit.customer!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
