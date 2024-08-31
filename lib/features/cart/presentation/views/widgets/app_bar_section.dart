import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var signInCubit = context.read<SignInCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: kToolbarHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          Text('${signInCubit.customer!.firstName} Cart',style: AppStyle.style20,),
          TextButton(
              style: const ButtonStyle(padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.all(0))),
              isSemanticButton: true,
              onPressed: (){}, child: Text('Place Order',style: AppStyle.style16.copyWith(color: kOrange),))
        ],
      ),
    );
  }
}
