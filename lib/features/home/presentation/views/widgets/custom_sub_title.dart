import 'package:flutter/material.dart';

import '../../../../../core/utility/app_style.dart';

class CustomSubTitle extends StatelessWidget {
  final String subTitle;
  const CustomSubTitle({
    super.key, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28,right: 28,bottom: 13),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(subTitle,style: AppStyle.style18.copyWith(fontWeight: FontWeight.w600,color: Colors.black),),
          const Icon(Icons.arrow_forward,size: 25,weight: 900,)
        ],
      ),
    );
  }
}
