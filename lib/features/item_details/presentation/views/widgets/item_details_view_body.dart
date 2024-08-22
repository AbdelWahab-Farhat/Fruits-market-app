import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/widgets/review_widget.dart';
import '../../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../../../core/widgets/price_section.dart';
import '../../../../../core/widgets/title_section.dart';
import 'custom_tab_bar.dart';
import 'header_section.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>  FocusScope.of(context).unfocus(),
        child: SizedBox(
          width: SizeConfig.viewWidth,
          height: SizeConfig.viewHeight,
          child:  const Stack(
            children: [
              HeaderSection(),
              CustomBottomSheet(
                widget: Padding(
                  padding: EdgeInsets.only(left: 28, right: 28, top: 16,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(),
                      SizedBox(height: 6),
                      PriceSection(),
                      SizedBox(height: 15),
                      ReviewWidget(),
                      SizedBox(height: 10),
                      Expanded(
                        child: CustomTabBar(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

