// ignore_for_file: prefer_const_declarations, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable, avoid_function_literals_in_foreach_calls, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/crud/read_data.dart';
import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final onTap;
  bool isButtonPressed;
  List<String> docIDs = [];

  var context;
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

  NeuButton({this.onTap, required this.isButtonPressed});
  //method for breaking the piggy, so we can reset the money
  void reset() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //Error message
          content: Text('¿Estás seguro de romper la hucha?'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFFE7ECEF);

    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backgroundColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 30.0,
                offset: Offset(-28, -28),
                color: Colors.white,
              ),
              BoxShadow(
                blurRadius: 30.0,
                offset: Offset(28, 28),
                color: Color(0xFFA7A9AF),
              ),
            ],
          ),
          child: SizedBox(
            height: 280,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/piggy_icon.png'),
                  width: 210,
                  height: 210,
                ),
                // Text(
                //   //tengo que meter el crud, o sea que cargue su dinero actual o que se ponga a 0 con un metodo reset del crud
                //   isButtonPressed ? '50€' : '0€',
                //   style: TextStyle(fontSize: 30, color: Colors.green),
                // ),
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
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              title: GetMoney(documentId: docIDs[index]),
                              textColor: Colors.green,
                              titleTextStyle: TextStyle(
                                fontSize: 30,
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
      ),
    );
  }
}
