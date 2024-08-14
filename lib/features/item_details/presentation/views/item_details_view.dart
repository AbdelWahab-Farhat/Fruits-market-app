import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/widgets/item_details_view_body.dart';

import '../../../../core/models/item.dart';

class ItemDetailsView extends StatelessWidget {
  final Item item;
  const ItemDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return  ItemDetailsViewBody(item: item,);
  }
}
