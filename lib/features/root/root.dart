import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/features/cart/presentation/views/cart_view.dart';
import 'package:fresh_fruits/features/categories/presentation/views/categories_view.dart';
import 'package:fresh_fruits/features/home/presentation/views/home_view.dart';
import 'package:fresh_fruits/features/profile/presentation/views/profile_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Root extends StatefulWidget {
   const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
   int _selectedIndex = 0;

  final List<Widget> _views = [
    const HomeView(),
    const CategoriesView(),
    const CartView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          onTabChange: (value) {
            _selectedIndex = value;
            setState(() {});
          },
          selectedIndex: _selectedIndex,
          tabBorderRadius: 30,
          backgroundColor: const Color(0xffFAFEFC),
          tabActiveBorder: Border.all(color: kLightGrey, width: 1), // tab button border
          curve: Curves.easeOutExpo, // tab animation curves
          duration: const Duration(milliseconds: 400), // tab animation duration
          gap: 4, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: kOrange, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: Colors.orange.withOpacity(0.1), // selected tab background color
          tabMargin: const EdgeInsets.only(left: 10 , right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.category,
              text: 'Categories',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
            GButton(icon: Icons.person, text: 'Profile'),
          ]
      ),
      body: _views[_selectedIndex],
    );
  }
}
