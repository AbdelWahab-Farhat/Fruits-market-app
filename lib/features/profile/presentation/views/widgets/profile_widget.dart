import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';

import '../../../../../core/utility/app_style.dart';


class ProfileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileWidget({
    required this.title,
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
        margin: const EdgeInsets.only(bottom: 10,top: 10  ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(icon,size: 30,color: kOrange,),
            const SizedBox(width: 20,),
            Text(title,style: AppStyle.style18.copyWith(color: kOrange),),
            const Spacer(),
            const Icon(Icons.arrow_back_ios,color: kOrange,)
          ],
        ),
      ),
    );
  }
}