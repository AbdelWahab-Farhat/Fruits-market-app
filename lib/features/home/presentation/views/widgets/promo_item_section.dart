import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';

class PromoItemSection extends StatelessWidget {
  const PromoItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 162,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: AspectRatio(
            aspectRatio: 1.7 / 1,
            child: Image.asset(
              'lib/assets/images/promo-food-1.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width:  162,
          padding: const EdgeInsets.only(left: 20,bottom: 21),
          clipBehavior: Clip.antiAlias,
          height: 162,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(colors: [
                const Color(0xff384144).withOpacity(0.7),
                const Color(0xff5B5B5B).withOpacity(0)
              ])),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Recommended Recipe Today',
              style: AppStyle.style16
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
