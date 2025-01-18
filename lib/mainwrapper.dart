import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langbridge/screens/AboutScreen.dart';
import 'package:langbridge/screens/BlogScreen.dart';
import 'package:langbridge/screens/homescreen.dart';

class Mainwrapper extends StatefulWidget {
  const Mainwrapper({super.key});

  @override
  State<Mainwrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<Mainwrapper> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LanguageTranslatorScreen(),
    Blogscreen(),// Home screen
    AboutScreen() // Profile screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              spreadRadius: 2, // How far the shadow spreads
              blurRadius: 5, // How blurred the shadow is
              offset: Offset(0, 3), // Shadow position (horizontal, vertical)
            ),
          ],
        ),
        height: 55, // Adjust the height to make the BottomNavigationBar smaller
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.translate_rounded, size: 21), // Home Icon
              label: 'Trans',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file_outlined, size: 21), // Home Icon
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline, size: 21), // Profile Icon
              label: 'About',
            ),
          ],
          backgroundColor: Colors.grey[200], // Background color for the BottomNavigationBar
          selectedItemColor: Colors.blue, // Color for selected icon
          unselectedItemColor: Colors.black, // Color for unselected icon
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: SafeArea(
        top: false,
        child: _pages[_selectedIndex], // Display the selected screen
      ),
    );
  }
}