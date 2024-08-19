import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import 'package:fresh_fruits/features/categories/presentation/viewModel/search_cubit/search_cubit.dart';
import '../../../../../core/models/item.dart';
import '../../../../../core/widgets/custom_grid_view_item.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';

class CategoryGridView extends StatelessWidget {

  const CategoryGridView({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchNotFound) {
          return Text(state.message,style: AppStyle.style16,);
        }
        else if (state is SearchFiltered) {
          return _searchResult(items: state.items);
        }
        else if (state is SearchInitial) {
          var searchCubit = context.read<SearchCubit>();
          return  _searchResult(items: searchCubit.allItems);
        }
        else {
          return const CustomLoadingWidget();
        }
      },
    );
  }

  GridView _searchResult({required List<Item> items}) {
    const double axisSpacing = 20;
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: axisSpacing,
        mainAxisSpacing: axisSpacing,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CustomGridViewItem(item: items[index],);
      },
    );
  }
}
