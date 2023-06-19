import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// POR HACER ////////////////////////////////////////////////////////////////////////

class AddMoney extends StatelessWidget {
  final String documentId;

  const AddMoney({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        //I have to add a set or update documentid in order to update with the added value
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
