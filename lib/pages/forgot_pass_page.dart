// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  //Pass reset method.
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //We get the error when the email is missing in the DB and print it to the screen.
            content: Text(
                '¡Enlace con el restablecimiento de contraseña enviado! Revisa tu correo electrónico.'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //We get the error when the email is missing in the DB and print it to the screen.
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Text('Establecer contraseña'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 20),

          // email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),

          SizedBox(height: 20),

          MaterialButton(
            onPressed: passwordReset,
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Enviar enlace para restablecer la contraseña',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
