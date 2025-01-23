import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';
import 'package:e_shop/custom_icons.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;
  bool isLogged = true;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ProfilePage(),
    const HomePage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Color(0xFFB2DBFF)),
        ),
        home: Scaffold(
          backgroundColor: Color(0xFFECEDEF),
          body: isLogged
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _pages[_selectedIndex],
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80.0),
                          topRight: Radius.circular(80.0),
                        ),
                        child: SizedBox(
                          height: 120.0,
                          child: BottomNavigationBar(
                            backgroundColor: Color(0xFFB2DBFF),
                            elevation: 0,
                            currentIndex: _selectedIndex,
                            onTap: navigateBottomBar,
                            selectedItemColor: Colors.white,
                            unselectedItemColor: Colors.white,
                            items: [
                              BottomNavigationBarItem(
                                icon: _buildIconWithCircle(CustomIcons.user, 0),
                                label: '',
                              ),
                              BottomNavigationBarItem(
                                icon: _buildIconWithCircle(CustomIcons.home, 1),
                                label: '',
                              ),
                              BottomNavigationBarItem(
                                icon: _buildIconWithCircle(
                                    CustomIcons.shopping_bag, 2),
                                label: '',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : LoginPage(),
        ));
  }

  Widget _buildIconWithCircle(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: Icon(
        icon,
        size: 40,
        color: isSelected ? Colors.black : Colors.white,
      ),
    );
  }
}
