import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';


class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28 ,left: 28,bottom: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good Morning',
              style: AppStyle.style14
                  .copyWith(color: const Color(0xff5F5F5F))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: SizeConfig.viewWidth! * .7,
                  child: Text(
                    'Abdelwahab Farhat Ali',
                    style: AppStyle.style20,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              SvgPicture.asset(
                  'lib/assets/icons/notification-not-active-icon.svg')
            ],
          ),
        ],
      ),
    );
  }
}
