// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, must_be_immutable

import 'package:firstapp/crud/read_data.dart';
import 'package:flutter/material.dart';

import 'elements/add_scope_page.dart';

class UserScope extends StatelessWidget {
  const UserScope({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Metas'),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'No tienes metas creadas, empieza a cumplir tus objetivos creando una meta desde el botón de "Añadir meta"',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // add scope
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddScopePage();
                      },
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Añadir meta',
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
            ],
          ),
        ),
      ),
    );
  }
}
