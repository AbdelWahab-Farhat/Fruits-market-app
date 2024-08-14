import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';

import '../../../../../core/models/item.dart';
import 'category_app_bar_section.dart';
import 'category_search_section.dart';

class CategoryViewBody extends StatelessWidget {
  final List<Item> items;
  const CategoryViewBody({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
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
               CategoryAppBarSection(items: items,),
              CategorySearchSection(items: items,),
            ],
          ),
        ),
      ),
    );
  }
}



