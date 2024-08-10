import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_pop_arrow.dart';

class AppBarTools extends StatelessWidget {
  const AppBarTools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 28,right: 28 ,top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPopArrow(color: Colors.white),
          Icon(Icons.share_outlined,size: 32,color: Colors.white,)
        ],
      ),
    );
  }
}
