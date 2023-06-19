// ignore_for_file: must_be_immutable, avoid_function_literals_in_foreach_calls, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        title: Center(
          child: Text('Resumen'),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                "Mi cuenta:",
                style: GoogleFonts.bebasNeue(fontSize: 40),
              ),
              SizedBox(height: 40),
              Text(
                '¡Empieza a ahorrar o márcate un objetivo nuevo!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 40,
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
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            title: GetFirstName(documentId: docIDs[index]),
                            textColor: Colors.red,
                            titleTextStyle: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
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
      ),
    );
  }
}
