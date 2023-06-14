// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(user.email!)),
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
