// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'content_pages/home.dart';
import 'content_pages/pig.dart';
import 'content_pages/scope.dart';
import 'content_pages/settings.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//Pages for navigatinbar
  final List<Widget> _pages = [
    UserHome(),
    UserPig(),
    UserScope(),
    UserSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        fixedColor: Colors.pink,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Resumen'),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Hucha'),
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Metas'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),

      /*
        GNAV, ES UN POCO MÁS BONITO

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
          child: GNav(
            //Background
            backgroundColor: Colors.black,
            //Text and icon of Not selected tabs
            color: Colors.white,
            //Text and icon of Selected tab
            activeColor: Colors.white,
            //Color around selected tab
            tabBackgroundColor: Colors.pink,
            tabActiveBorder: Border.all(color: Colors.black),
            //Space for expanding
            gap: 12,
            selectedIndex: _selectedIndex,
            duration: Duration(milliseconds: 500),

            onTabChange: (index) {
              _selectedIndex = index;
            },

            padding: EdgeInsets.all(18),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Resumen',
              ),
              GButton(
                icon: Icons.savings,
                text: 'Hucha',
              ),
              GButton(
                icon: Icons.insights,
                text: 'Metas',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Ajustes',
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
