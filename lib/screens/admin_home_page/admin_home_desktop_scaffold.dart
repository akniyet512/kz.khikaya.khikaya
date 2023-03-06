import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khikaya/widgets/clickable_widget.dart';

class AdminHomeDesktopScaffold extends StatefulWidget {
  const AdminHomeDesktopScaffold({super.key});

  @override
  State<AdminHomeDesktopScaffold> createState() =>
      _AdminHomeDesktopScaffoldState();
}

class _AdminHomeDesktopScaffoldState extends State<AdminHomeDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('requests')
            .orderBy('date')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                borderOnForeground: false,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: snapshot.data!.docs[index].get('status') ==
                                "pending"
                            ? Colors.yellow
                            : snapshot.data!.docs[index].get('status') ==
                                    "allowed"
                                ? Colors.green
                                : Colors.red,
                        width: 8,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(snapshot.data!.docs[index].get('requestType')),
                            Text(snapshot.data!.docs[index].get('uid')),
                            Text(snapshot.data!.docs[index]
                                .get('date')
                                .toDate()
                                .toString()),
                            Text(snapshot.data!.docs[index].get('status')),
                          ],
                        ),
                      ),
                      snapshot.data!.docs[index].get('status') != "pending"
                          ? Container()
                          : Column(
                              children: [
                                ClickableWidget(
                                  onTap: () async {
                                    await snapshot.data!.docs[index].reference
                                        .set(
                                      {
                                        "status": "allowed",
                                      },
                                      SetOptions(merge: true),
                                    );
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(snapshot.data!.docs[index]
                                            .get('uid'))
                                        .set(
                                      {
                                        "userMode": 2,
                                      },
                                      SetOptions(merge: true),
                                    );
                                  },
                                  child: Icon(Icons.check),
                                ),
                                ClickableWidget(
                                  onTap: () async {
                                    await snapshot.data!.docs[index].reference
                                        .set(
                                      {
                                        "status": "denied",
                                      },
                                      SetOptions(merge: true),
                                    );
                                  },
                                  child: Icon(Icons.close),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
