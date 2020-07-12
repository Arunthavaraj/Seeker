import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final databaseReference = Firestore.instance;

  void createRecord() async {
  await databaseReference.collection("books")
      .document("1")
      .setData({
        'title': 'Mastering Flutter',
        'description': 'Programming Guide for Dart'
      });

  DocumentReference ref = await databaseReference.collection("books")
      .add({
        'title': 'Flutter in Action',
        'description': 'Complete Programming Guide to learn Flutter'
      });
  print(ref.documentID);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Center(child: 
      Text(""),)
    );
  }
}
