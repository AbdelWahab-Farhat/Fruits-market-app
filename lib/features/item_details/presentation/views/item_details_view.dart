import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/widgets/item_details_view_body.dart';

import '../../../../core/models/item.dart';
import '../../data/repo/item_details_repo_impl.dart';

class ItemDetailsView extends StatelessWidget {
  final Item item;

  const ItemDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemDetailsCubit(item: item, itemDetailsRepo: ItemDetailsRepoImpl()),
      child: const ItemDetailsViewBody(),
    );
  }
}
