import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.star,size: 30,color: kLightYellow,),
      const SizedBox(width: 5,),
      Text('4.5',style: AppStyle.style18.copyWith(fontWeight: FontWeight.w600,color: Colors.black,)),
      const SizedBox(width: 9,),
      Text('(128 reviews)',style: AppStyle.style14.copyWith(color: const Color(0xffAAAAAA)),)
    ],
    );
  }
}
