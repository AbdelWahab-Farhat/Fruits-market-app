import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';

import '../../../../../core/models/item.dart';
import 'app_bar_tools.dart';
import 'custom_item_image.dart';
import 'custom_page_ind.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ItemDetailsCubit itemDetailsCubit = context.read<ItemDetailsCubit>();
    final PageController controller = PageController();
    return  Stack(
      children: [
        CustomItemImage(controller: controller, item: itemDetailsCubit.item,),
        const AppBarTools(),
        CustomPageInd(controller: controller),
      ],
    );
  }
}

