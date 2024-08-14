import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/widgets/custom_error_widget.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
import 'package:fresh_fruits/features/home/presentation/manger/items_cubit/items_cubit.dart';

import '../../../../../core/models/category_item.dart';
import '../../../../../core/utility/size_config.dart';
import 'category_item_section.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const categories = CategoryItem.allItems;
    return BlocBuilder<ItemsCubit, ItemsState>(
      builder: (context, state) {
        if (state is ItemsSuccess) {
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: SizeConfig.viewWidth,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) =>
                  CategoryItemSection(category: categories[index], items: state.items,),
            ),
          );
        }
        else if (state is ItemsFailure) {
          return  CustomErrorWidget(errMessage: state.errMessage,);
        }
        else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
