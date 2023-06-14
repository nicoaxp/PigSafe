import 'package:firstapp/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Inittialy, show the login page
  bool showLoginpage = true;

  //Change the state of screen, the reverse of the current loginpage.
  void toggleScreens() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
