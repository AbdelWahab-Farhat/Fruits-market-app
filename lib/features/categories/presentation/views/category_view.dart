import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/categories/presentation/viewModel/search_cubit/search_cubit.dart';
import '../../../../core/models/item.dart';
import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  final List<Item> items;

  const CategoryView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(items),
      child: const CategoryViewBody(),
    );
  }
}
