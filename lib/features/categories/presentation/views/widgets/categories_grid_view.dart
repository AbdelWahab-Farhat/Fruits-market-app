import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
import 'package:fresh_fruits/features/categories/presentation/viewModel/categories_cubit/categories_cubit.dart';
import 'package:fresh_fruits/features/categories/presentation/views/widgets/categories_grid_view_item.dart';
import '../../../../../core/models/category_item.dart';
import '../../../../../core/widgets/custom_error_widget.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const categories = CategoryItem.allItems;
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          var items = state.items;
          return GridView.builder(
            padding: const EdgeInsets.only(top: 20, left: 28, right: 28),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.80
            ),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoriesGridViewItem(itemsByCategory: itemsByCategory(items, categories[index]));
            },
          );
        }
        else if (state is CategoriesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}

