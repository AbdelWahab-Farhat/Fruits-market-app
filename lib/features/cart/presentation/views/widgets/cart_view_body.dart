import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'app_bar_section.dart';
import 'cart_builder.dart';


class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    context.read<CartCubit>().fetchCustomerCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        children: [
          AppBarSection(),
          Divider(
            color: kLightGrey,
          ),
          CartBuilder()
        ],
      ),
    );
  }
}




