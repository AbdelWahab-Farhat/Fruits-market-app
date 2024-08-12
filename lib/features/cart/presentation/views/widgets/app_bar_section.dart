import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: kToolbarHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          Text('Mohamed Cart',style: AppStyle.style20,),
          TextButton(
              style: const ButtonStyle(padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.all(0))),
              isSemanticButton: true,
              onPressed: (){}, child: Text('Place Order',style: AppStyle.style16.copyWith(color: kOrange),))
        ],
      ),
    );
  }
}
