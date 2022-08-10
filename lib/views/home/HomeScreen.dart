import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_pjt/views/screens/LandingPage.dart';
import 'package:personal_pjt/views/screens/Library.dart';
import 'package:personal_pjt/views/screens/PremiumPage.dart';
import 'package:personal_pjt/views/screens/SearchAndGenre.dart';
import 'package:personal_pjt/views/screens/SearchPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List _pages = [
    LandingPage(),
    SearchAndGenre(),
    LibraryPage(),
    PremiumPage()
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: "Search",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books_outlined,
                color: Colors.white,
              ),
              label: "Library",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: "Premium",
              backgroundColor: Colors.black),
        ],
        unselectedFontSize: 12,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        iconSize: 32,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onTappedItem,
        elevation: 5,
      ),
    );
  }
}
