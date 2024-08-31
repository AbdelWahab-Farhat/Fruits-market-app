import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import '../../../../../core/utility/helper.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../manger/cart_cubit/cart_cubit.dart';
import 'cart_item_widget.dart';

class CartBuilder extends StatelessWidget {
  const CartBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess && state.message != null) {
          showTopSnackBar(context, state.message!);
        }
      },
      builder: (context, state) {
        var cartCubit = context.read<CartCubit>();
        if (state is CartSuccess) {
          if (cartCubit.cartItems.isEmpty) {
            return Expanded(
                child: Center(
                    child: Text(
              'Cart is empty',
              style: AppStyle.style18.copyWith(color: Colors.black),
            )));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: cartCubit.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartCubit.cartItems[index],
                );
              },
            );
          }
        } else if (state is CartFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
