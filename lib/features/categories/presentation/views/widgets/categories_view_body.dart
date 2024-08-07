import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/categories/presentation/views/widgets/categories_grid_view.dart';
import 'categories_app_bar_section.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CategoriesAppBarSection(),
      body: CategoriesGridView(),
    );
  }
}


