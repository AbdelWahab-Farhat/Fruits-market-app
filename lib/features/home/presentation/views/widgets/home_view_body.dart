import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/widgets/custom_filled_button.dart';
import 'app_bar_section.dart';
import 'category_section.dart';
import 'custom_sub_title.dart';
import 'promo_section.dart';
import 'trending_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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