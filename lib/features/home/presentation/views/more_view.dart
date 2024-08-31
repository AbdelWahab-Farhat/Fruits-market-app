import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/home/presentation/views/widgets/more_view_body.dart';

import '../../../../core/models/item.dart';


class MoreView extends StatelessWidget {
  final List<Item> items;
  const MoreView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MoreViewBody(items: items,);
  }
}
