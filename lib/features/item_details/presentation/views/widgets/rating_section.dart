import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
import 'package:fresh_fruits/core/widgets/custom_outlined_button.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/rate_cubit/rate_cubit.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({super.key});

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  double _currentValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RateCubit, RateState>(
      listener: (context, state) {
        if (state is RateFailure) {
          showTopSnackBar(context, state.errMessage);
        }
        else if (state is RateSuccess) {
          showTopSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is RateLoading) {
           return const CustomLoadingWidget();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Heading
            const Text(
              'Rate Your Experience',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Rating Display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_currentValue.toInt()}.0',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: kOrange,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.star,
                  color: kLightYellow,
                  size: 28,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Slider
            Slider(
              inactiveColor: Colors.grey.shade400,
              activeColor: kOrange,
              value: _currentValue,
              min: 1,
              max: 5,
              divisions: 4,
              label: _currentValue.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),

            // Slider Labels
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Poor', style: TextStyle(color: Colors.grey)),
                  Text('Excellent', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const Spacer(),

            // Submit Button
            CustomOutlinedButton(
              title: 'Submit',
              onTap: ()  {
                var currentItem  = context.read<ItemDetailsCubit>().item;
               context.read<RateCubit>().rateIt(currentItem, _currentValue).then(
                 (value) {
                   context.read<ItemDetailsCubit>().updatedItem();
                 },
               );
              },
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
