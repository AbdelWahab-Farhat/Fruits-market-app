import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

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
              Tab(text: 'Description'),
              Tab(text: 'Reviews'),
              Tab(text: 'Discussion'),
            ],
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10,bottom: 80),
              child: TabBarView(
                children: [
                  Center(child: Text('Description Content')),
                  Center(child: Text('Reviews Content')),
                  Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text('Discussion content'),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
