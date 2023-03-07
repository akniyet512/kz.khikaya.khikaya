import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';
import 'package:khikaya/widgets/custom_button.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/header_section_widget.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/mentor_home_page/event_type_card_widget.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/mentor_home_page/my_calendar_section_widget.dart';

class MentorHomeDesktopScaffold extends StatefulWidget {
  const MentorHomeDesktopScaffold({super.key});

  @override
  State<MentorHomeDesktopScaffold> createState() =>
      _MentorHomeDesktopScaffoldState();
}

class _MentorHomeDesktopScaffoldState extends State<MentorHomeDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const HeaderSectionWidget(),
          const MyCalendarSectionWidget(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 30,
              ),
              child: CustomButton(
                height: 32,
                width: 172,
                text: "+ New event type",
                onTap: () =>
                    Navigator.of(context).pushNamed('/new-event-type-first'),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("eventTypes")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 9 / 5,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 32,
                    ),
                    itemBuilder: (context, index) {
                      return EventTypeCardWidget(
                        name: snapshot.data!.docs[index].get('eventName'),
                        duration: snapshot.data!.docs[index]
                            .get('duration')
                            .toString(),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
