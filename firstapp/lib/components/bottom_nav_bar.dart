import 'package:flutter/material.dart';
import 'package:firstapp/custom_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          color: Colors.white,
          activeColor: Colors.white,
          tabActiveBorder: Border.all(color: Colors.red.shade300),
          tabBackgroundColor: Colors.red.shade300,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 30,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: CustomIcons.home,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(right: 40),
            ),
            GButton(
              icon: CustomIcons.library_icon,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 40),
            )
          ],
        ));
  }
}
