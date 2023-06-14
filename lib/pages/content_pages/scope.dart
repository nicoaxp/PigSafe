// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'elements/add_scope_page.dart';

class UserScope extends StatelessWidget {
  const UserScope({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return const Center(
  //     child: Text(
  //       'No tienes metas creadas, haz click en el botón de crear meta para empezar a cumplir tus objetivos. ',
  //       style: TextStyle(fontSize: 20),
  //     ),
  //     Padding(),

  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No tienes metas creadas, empieza a cumplir tus objetivos creando una meta desde el botón de "Añadir meta"',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                //Añadir meta
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AddScopePage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Añadir meta',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
