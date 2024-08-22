import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/widgets/custom_filled_button.dart';
import 'package:fresh_fruits/features/auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'package:fresh_fruits/features/home/presentation/manger/items_cubit/items_cubit.dart';
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
    return const Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AppBarSection(),
                ),
                SliverToBoxAdapter(
                  child: PromoSection(),
                ),
                SliverToBoxAdapter(
                  child: CustomSubTitle(
                    subTitle: 'Categories',
                  ),
                ),
                SliverToBoxAdapter(
                  child: CategorySection(),
                ),
                SliverToBoxAdapter(
                  child: CustomSubTitle(
                    subTitle: 'Trending Deals',
                  ),
                ),
                SliverToBoxAdapter(
                  child: TrendingSection(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28,vertical: 30),
                    child: CustomFilledButton(
                      title: 'More',
                      color: Colors.black,

                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}