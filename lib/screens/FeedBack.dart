import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("feeback form"),
      ),
    );
  }
}

// Define a custom Form widget.
class FeedBackform extends StatefulWidget {
  @override
  _FeedBackformState createState() => _FeedBackformState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _FeedBackformState extends State<FeedBackform> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final databaseReference = Firestore.instance;

  void createRecord(String text) async {
  

  DocumentReference ref = await databaseReference.collection("feeback")
      .add({
        'feedback': text
      });
  print(ref.documentID);
}


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "enter your feedback"
            ),
            controller: myController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          createRecord(myController.text);
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
  

 