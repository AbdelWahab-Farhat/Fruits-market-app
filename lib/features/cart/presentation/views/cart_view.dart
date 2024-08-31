import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/cart/data/repo/cart_repo_impl.dart';
import 'package:fresh_fruits/features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:fresh_fruits/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRepoImpl()),
      child: const CartViewBody(),
    );
  }
}
