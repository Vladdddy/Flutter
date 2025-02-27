import 'package:firstapp/components/bottom_nav_bar.dart';
import 'package:firstapp/custom_icons.dart';
import 'package:firstapp/pages/cart_page.dart';
import 'package:firstapp/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                CustomIcons.menu2,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'lib/images/pfp.jpg',
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 50),
              child: ListTile(
                leading: Icon(CustomIcons.home, color: Colors.grey[100]),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading:
                    Icon(CustomIcons.library_icon, color: Colors.grey[100]),
                title: Text(
                  "Your Collection",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(CustomIcons.category, color: Colors.grey[100]),
                title: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(CustomIcons.user, color: Colors.grey[100]),
                title: Text(
                  "Authors",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(CustomIcons.fire, color: Colors.grey[100]),
                title: Text(
                  "News",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Divider(
                color: Colors.grey[800],
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(CustomIcons.themes, color: Colors.red.shade300),
                title: Text(
                  "Themes",
                  style: TextStyle(
                    color: Colors.red.shade300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(CustomIcons.settings, color: Colors.red.shade300),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.red.shade300,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red.shade300),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red.shade300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
