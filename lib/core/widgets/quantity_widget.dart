import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utility/app_style.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.remove ,size: 30,color: kLightYellow,),
      const SizedBox(width: 10),
      SizedBox(
          width: 40,
          child: Text('100',style: AppStyle.style20.copyWith(fontWeight:FontWeight.w500),textAlign: TextAlign.center,)),
      const SizedBox(width: 10),
      const Icon(Icons.add ,size: 30,color: kLightYellow,),
    ],
    );
  }
}

