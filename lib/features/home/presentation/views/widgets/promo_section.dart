import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/widgets/custom_error_widget.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
import 'package:fresh_fruits/features/home/presentation/manger/items_cubit/items_cubit.dart';

import '../../../../../core/utility/size_config.dart';
import 'promo_items_section.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsCubit, ItemsState>(
      builder: (context, state) {
        if (state is ItemsSuccess) {
          return SizedBox(
            width: SizeConfig.viewWidth,
            height: 162,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 28, bottom: 30),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: PromoItemsSection(item: state.items[index]),
              );
              },
            ),
          );
        }
        else if (state is ItemsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
