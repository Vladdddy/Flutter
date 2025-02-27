import 'package:flutter/material.dart';
import 'pages/profile_page.dart';
import 'pages/quest_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;

  void navigateBottomBar(int currentPage) {
    setState(() {
      _currentPage = currentPage;
    });
  }

  final List<Widget> _pages = [
    const QuestPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solo Leveling',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: Scaffold(
        body: _pages[_currentPage],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Color(0xFF052A48),
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Color(0xFF1B5685)),
            selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 12),
            selectedItemColor: Color(0xFFFFFFFF),
            unselectedItemColor: Color(0xFF1B5685),
            backgroundColor: Color(0xFF052A48),
            currentIndex: _currentPage,
            onTap: navigateBottomBar,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
