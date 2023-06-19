// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'content_pages/home.dart';
import 'content_pages/pig.dart';
import 'content_pages/scope.dart';
import 'content_pages/settings.dart';

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
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Resumen'),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Hucha'),
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Metas'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }
}
