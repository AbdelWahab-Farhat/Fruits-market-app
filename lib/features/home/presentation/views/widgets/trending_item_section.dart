import 'package:flutter/material.dart';

import '../../../../../core/utility/app_style.dart';

class TrendingItemSection extends StatelessWidget {

  const TrendingItemSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: const DecorationImage(
              image: AssetImage('lib/assets/images/promo-food-1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14,bottom: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Pototo',
                  style:AppStyle.style18
              ),
              const SizedBox(height: 5,),
              Text(
                  '\$22',
                  style: AppStyle.style14.copyWith(fontWeight: FontWeight.bold,color: Colors.white)
              ),
            ],
          ),
        ),
      ],
    );
  }
}