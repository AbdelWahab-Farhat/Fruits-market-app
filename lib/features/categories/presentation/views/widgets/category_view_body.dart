import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:fresh_fruits/features/categories/presentation/viewModel/search_cubit/search_cubit.dart';
import 'category_app_bar_section.dart';
import 'category_search_section.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var searchCubit = context.read<SearchCubit>();
    return Scaffold(
      resizeToAvoidBottomInset:
          false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          height: SizeConfig.viewHeight,
          width: SizeConfig.viewWidth,
          child:  Stack(
            children: [
               CategoryAppBarSection(items: searchCubit.allItems,),
              const CategorySearchSection(),
            ],
          ),
        ),
      ),
    );
  }
}



