import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/widgets/rating_section.dart';
import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import 'comment_section.dart';
import 'pay_des_section.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TabBarView(
                children: [
                  PayDesSection(),
                  CommentSection(),
                  RatingSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

