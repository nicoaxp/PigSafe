// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../crud/read_data.dart';

class my_account extends StatefulWidget {
  const my_account({super.key});

  @override
  State<my_account> createState() => _my_accountState();
}

class _my_accountState extends State<my_account> {
  final user = FirebaseAuth.instance.currentUser!;
  //document IDs
  List<String> docIDs = [];

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
        title: Text('Mi cuenta'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            "Mi cuenta:",
            style: GoogleFonts.bebasNeue(fontSize: 40),
          ),
          SizedBox(height: 40),
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
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        title: GetUsername(documentId: docIDs[index]),
                        textColor: Colors.blue,
                        titleTextStyle: TextStyle(fontSize: 30),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
