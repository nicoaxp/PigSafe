// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUsername extends StatelessWidget {
  final String documentId;

  GetUsername({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot) {
          //TO KNOW IF IT'S LOADED OR NOT
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['first name']}' +
                ' ' +
                '${data['last name']}' +
                ' ' +
                '${data['age']}' +
                ' tiene ' +
                '${data['money']}' +
                '€');
          }

          return Text('Loading...');
        });
  }
}

class GetMoney extends StatelessWidget {
  final String documentId;

  GetMoney({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot) {
          //TO KNOW IF IT'S LOADED OR NOT
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['money']}' + '€');
          }

          return Text('Loading...');
        });
  }
}
