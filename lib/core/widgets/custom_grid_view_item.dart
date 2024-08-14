import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';
import '../utility/app_style.dart';
import 'custom_cached_image.dart';

class CustomGridViewItem extends StatelessWidget {
  final Item item;
  const CustomGridViewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.itemDetailsView,extra: item),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: CustomCachedImage(imageURL: item.imageURL),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: SizeConfig.viewWidth,
              height: SizeConfig.viewHeight! * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:
                [Colors.black.withOpacity(0.0) ,Colors.black , ])
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: AppStyle.style18.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: AppStyle.style14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
