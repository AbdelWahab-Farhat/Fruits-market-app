import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/profile/presentation/views/widgets/profile_widget.dart';
import 'package:fresh_fruits/features/profile/presentation/views/widgets/user_info_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserInfoSection(),
            const ProfileWidget(title: 'Setting', icon: Icons.settings_outlined,),
             Divider(color: Colors.black.withOpacity(0.1),),
            const ProfileWidget(title: 'Payments', icon: Icons.payments_outlined,),
            Divider(color: Colors.black.withOpacity(0.1),),
            const ProfileWidget(title: 'Notification', icon: CupertinoIcons.bell,),
            Divider(color: Colors.black.withOpacity(0.1),),
            const ProfileWidget(title: 'Location', icon: CupertinoIcons.location,),
            Divider(color: Colors.black.withOpacity(0.1),),
          ],
        ),
      ),
    );
  }
}



