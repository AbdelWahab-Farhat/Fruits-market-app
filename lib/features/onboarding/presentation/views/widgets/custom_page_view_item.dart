import 'package:flutter/material.dart';

import '../../../../../core/utility/app_style.dart';

class CustomPageViewItem extends StatelessWidget {
  final String imageURL;
  final String title;
  final String subTitle;
  const CustomPageViewItem({
    super.key, required this.imageURL, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150,left: 24,right: 24),
      child: Column(
        children: [
          Image.asset(imageURL),
          const SizedBox(height: 40,),
          Text(title,style:AppStyle.style24,textAlign: TextAlign.center,),
          const SizedBox(height: 24,),
          Text(subTitle,style:AppStyle.style14,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
