import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/connector/auth_connector.dart';
import 'package:spotify/i18n/localisation_service.dart';
import 'package:spotify/views/screens/LandingPage.dart';
import 'package:spotify/views/screens/Library.dart';
import 'package:spotify/views/screens/PremiumPage.dart';
import 'package:spotify/views/screens/SearchAndGenre.dart';

//import 'package:spotify/i18n/localisation_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.model}) : super(key: key);

  final AuthViewModel model;

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

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext c, AuthViewModel model) {
        return Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                //label: "Home",
                label: LocalisationService.of(context).translate("Nav_Home"),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label:
                      LocalisationService.of(context).translate("Nav_Search"),
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.library_books_outlined,
                    color: Colors.white,
                  ),
                  label:
                      LocalisationService.of(context).translate("Nav_Library"),
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.spotify,
                    color: Colors.white,
                    size: 32,
                  ),
                  label:
                      LocalisationService.of(context).translate("Nav_Premium"),
                  backgroundColor: Colors.black),
            ],
            unselectedFontSize: 12,
            selectedFontSize: 12,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            iconSize: 32,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: (int index) {
              if (index == 2) {
                model.fetchUserSavedAlbum();
              }
              if (index == 1) {
                model.fetchAvailableGenre!();
              }
              setState(() {
                _selectedIndex = index;
              });
            },
            elevation: 5,
          ),
        );
      },
    );
  }
}
