import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/categories/presentation/viewModel/categories_cubit/categories_cubit.dart';
import 'package:fresh_fruits/features/categories/presentation/views/widgets/categories_grid_view.dart';
import 'categories_app_bar_section.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  @override
  void initState() {
    var categoriesCubit = context.read<CategoriesCubit>();
    categoriesCubit.fetchItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CategoriesAppBarSection(),
      body: CategoriesGridView(),
    );
  }
}


