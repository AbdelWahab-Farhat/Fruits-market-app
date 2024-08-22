import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/models/item.dart';
import 'package:fresh_fruits/core/widgets/custom_outlined_button.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/widgets/comment_text_field.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/widgets/rating_section.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../manger/item_details_cubit/item_details_cubit.dart';
import 'comment_section.dart';
import 'comment_widget.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var item = context
        .read<ItemDetailsCubit>()
        .item;
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: kLightYellow,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: AppStyle.style14,
            tabs: const [
              Tab(text: 'Pay & Info'),
              Tab(text: 'Reviews'),
              Tab(text: 'Rating'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: TabBarView(
                children: [
                  PayDesSection(item: item),
                  const CommentSection(),
                  const RatingSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PayDesSection extends StatelessWidget {
  const PayDesSection({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
      builder: (context, state) {
        var itemCubit = context.read<ItemDetailsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text(item.description!, style: AppStyle.style14, maxLines: 4,),
            Spacer(),
            CustomOutlinedButton(
              title: 'Payment\n \$${item.price * itemCubit.quantity}', onTap: () {},),
            const SizedBox(height: 20,),
          ],
        );
      },
    );
  }
}

