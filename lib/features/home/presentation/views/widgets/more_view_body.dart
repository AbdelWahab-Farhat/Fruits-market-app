import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import '../../../../../core/models/item.dart';
import '../../../../../core/widgets/custom_grid_view_item.dart';

class MoreViewBody extends StatelessWidget {
  final List<Item> items;
  const MoreViewBody({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More',style: AppStyle.style20,),backgroundColor: kLightWhite,),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomGridViewItem(item: item);
        },
      ),
    );
  }
}
