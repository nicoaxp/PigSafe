// ignore_for_file: prefer_const_constructors, prefer_const_declarations, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'elements/neu_button.dart';

class UserPig extends StatefulWidget {
  const UserPig({super.key});

  @override
  State<UserPig> createState() => _UserPigState();
}

class _UserPigState extends State<UserPig> {
  bool isButtonPressed = false;

  void buttonPressed() {
    setState(() {
      if (isButtonPressed == false) {
        isButtonPressed = true;
      } else if (isButtonPressed == true) {
        isButtonPressed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tu hucha virtual',
                  style: GoogleFonts.bebasNeue(fontSize: 40),
                ),
                SizedBox(height: 30),
                NeuButton(
                  onTap: buttonPressed,
                  isButtonPressed: isButtonPressed,
                ),
                SizedBox(height: 30),

                // add money
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: GestureDetector(
                    //onTap: () => addMoney(),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Introducir ahorro',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'Historial de transacciones',
                  style: GoogleFonts.bebasNeue(fontSize: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
