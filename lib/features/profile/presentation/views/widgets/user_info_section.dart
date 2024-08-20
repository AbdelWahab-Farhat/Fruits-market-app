import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import '../../../../../core/utility/app_style.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeConfig.viewWidth,
        height: SizeConfig.viewHeight! * 0.30,
        child: Stack(
          children: [
            ClipPath(
              clipper: _CurvedClipper(),
              child: Container(
                height: 250.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade700,
                      kLightYellow
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                height: 100,
                width: 100,
                decoration:  const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'lib/assets/images/user.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: SizeConfig.viewWidth,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Abdulwahab Farhat',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: AppStyle.style24.copyWith(color: Colors.white),
                  )),
            )
          ],
        )
    );
  }
}

class _CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
