// ignore_for_file: must_be_immutable, avoid_function_literals_in_foreach_calls, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../crud/read_data.dart';

class UserHome extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  //document IDs
  List<String> docIDs = [];

  UserHome({super.key});

//this will bring us to the collection we select
  // get docIDs
  Future getDocID() async {
    //We set the docIDs to empty so we don't get duplicated data
    docIDs = [];
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              //add each collection to the real value
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              '¡Bienvenido! ' + user.email!,
              style: TextStyle(fontSize: 24),
            ),
            Expanded(
              child: FutureBuilder(
                //what im waiting for to execute, in this case is getDocID
                future: getDocID(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      //we return the list tile from the doc ID
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetUsername(documentId: docIDs[index]),
                          tileColor: Colors.pink[100],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
