import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomeDesktopScaffold extends StatefulWidget {
  const UserHomeDesktopScaffold({super.key});

  @override
  State<UserHomeDesktopScaffold> createState() =>
      _UserHomeDesktopScaffoldState();
}

class _UserHomeDesktopScaffoldState extends State<UserHomeDesktopScaffold> {
  TextEditingController _messageController = TextEditingController();
  TextEditingController _googleMeetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Request to become mentor"),
            Card(
              child: Column(
                children: [
                  TextField(
                    controller: _googleMeetController,
                    
                  ),
                  TextField(
                    controller: _messageController,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_googleMeetController.text.isNotEmpty) {
                        await FirebaseFirestore.instance
                            .collection('requests')
                            .doc()
                            .set({
                          "requestType": "toBeMentor",
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "date": DateTime.now(),
                          "status": "pending",
                        });
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
