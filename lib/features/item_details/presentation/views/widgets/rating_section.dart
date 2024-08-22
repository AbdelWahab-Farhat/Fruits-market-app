import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/widgets/custom_outlined_button.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({super.key});

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  double _currentValue = 1.0;

  @override
  Widget build(BuildContext context) {
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
          onTap: () {
            // Handle submit logic
          },
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
