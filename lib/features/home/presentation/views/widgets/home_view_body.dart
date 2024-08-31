import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/widgets/custom_filled_button.dart';
import 'package:fresh_fruits/features/home/presentation/manger/items_cubit/items_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utility/app_router.dart';
import 'app_bar_section.dart';
import 'category_section.dart';
import 'custom_sub_title.dart';
import 'promo_section.dart';
import 'trending_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ItemsCubit>().fetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppBarSection(),
            ),
            const SliverToBoxAdapter(
              child: PromoSection(),
            ),
            const SliverToBoxAdapter(
              child: CustomSubTitle(
                subTitle: 'Categories',
              ),
            ),
            const SliverToBoxAdapter(
              child: CategorySection(),
            ),
            const SliverToBoxAdapter(
              child: CustomSubTitle(
                subTitle: 'Trending Deals',
              ),
            ),
            const SliverToBoxAdapter(
              child: TrendingSection(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 30),
                child: BlocBuilder<ItemsCubit, ItemsState>(
                  builder: (context, state) {
                    if (state is ItemsSuccess) {
                      return CustomFilledButton(
                        onTap: () =>
                            GoRouter.of(context).push(AppRouter.moreView, extra:state.items),
                        title: 'More',
                        color: Colors.black,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}