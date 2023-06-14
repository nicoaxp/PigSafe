// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddScopePage extends StatefulWidget {
  const AddScopePage({super.key});

  @override
  State<AddScopePage> createState() => _AddScopePageState();
}

class _AddScopePageState extends State<AddScopePage> {
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();
  final _typeController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  Future addUserScope(
      String name, double value, String date, String type) async {
    await FirebaseFirestore.instance.collection('scopes').add({
      'name': name,
      'value': value,
      'date': date,
      'type': type,
      'user': user.email,
    });
  }

  //Method for sign up
  Future createScope() async {
    //add user data
    addUserScope(
      _nameController.text.trim(),
      double.parse(_valueController.text.trim()),
      _dateController.text.trim(),
      _typeController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir una meta nueva'),
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Ingresa los datos de tu nuevo objetivo, pueden ser unas vacaciones, un coche nuevo o ¡una PlayStation 5!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 20),

          // name textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Nombre',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),

          SizedBox(height: 15),

          // value textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _valueController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Cantidad a ahorrar',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),

          SizedBox(height: 15),

          // date textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _dateController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Fecha de finalización de meta',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),

          SizedBox(height: 15),

          // type textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _typeController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Tipo de ahorro',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),

          SizedBox(height: 25),

          // sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () => createScope(),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '¡Añadir meta!',
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
    );
  }
}
