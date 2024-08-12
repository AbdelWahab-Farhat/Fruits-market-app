import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:fresh_fruits/core/widgets/quantity_widget.dart';
import 'app_bar_section.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarSection(),
          const Divider(
            color: kLightGrey,
          ),
          Slidable(
            endActionPane: ActionPane(
              extentRatio: 1/5,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context){} ,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
                    icon: Icons.delete,
                    backgroundColor: Colors.black,
                  ),
                ]),
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              width: SizeConfig.viewWidth,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              height: 137,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemImagePrice(),
                  InfoColumnWithTotalPrice(),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      QuantityWidget(),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InfoColumnWithTotalPrice extends StatelessWidget {
  const InfoColumnWithTotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fruits',
          style: AppStyle.style14.copyWith(
              color: Colors.black.withOpacity(
                0.6,
              ),
              fontWeight: FontWeight.w600),
        ),
        Text(
          'Banana',
          style: AppStyle.style16,
        ),
        const Spacer(),
        Text(
          '\$ 25.22',
          style: AppStyle.style18
              .copyWith(color: kOrange, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class ItemImagePrice extends StatelessWidget {
  const ItemImagePrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'lib/assets/images/orange-photo.png',
              fit: BoxFit.cover,
              width: 100,
              height: 137,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: kLightYellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '\$ 24.44',
                style: AppStyle.style16.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
