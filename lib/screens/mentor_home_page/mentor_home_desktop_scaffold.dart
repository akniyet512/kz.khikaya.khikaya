import 'package:flutter/material.dart';
import 'package:khikaya/services/authorization_services.dart';
import 'package:khikaya/widgets/clickable_widget.dart';

class MentorHomeDesktopScaffold extends StatefulWidget {
  const MentorHomeDesktopScaffold({super.key});

  @override
  State<MentorHomeDesktopScaffold> createState() =>
      _MentorHomeDesktopScaffoldState();
}

class _MentorHomeDesktopScaffoldState extends State<MentorHomeDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidgets(
        screenSize: screenSize,
      ),
      body: Column(
        children: [
          MyCalendar(screenSize: screenSize),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: CustomButton(
                    height: 32,
                    width: 172,
                    text: "+   New event type",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MeetingCard(),
                MeetingCard(),
                MeetingCard(),
                MeetingCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ClickableWidget(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFFE9D700).withOpacity(0.6),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1.5,
            color: Color(0xFF000000),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Montserrat',
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCalendar extends StatelessWidget {
  final Size screenSize;
  const MyCalendar({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(0, 3), // negative vertical offset
                blurRadius: 3,
              ),
            ],
          ),
          height: screenSize.height / 7.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "my calendar".toUpperCase(),
                      style: const TextStyle(
                          fontFamily: 'NEXT ART',
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "event type".toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'NEXT ART',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        Text(
                          "Scheduled event".toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'NEXT ART',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 1.2,
                decoration:
                    BoxDecoration(color: Color(0xFFE9D700).withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget MeetingCard() {
  return Card(
    child: Container(
      height: 132,
      width: 230,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 5), // negative vertical offset
                blurRadius: 5,
                spreadRadius: 0.5)
          ],
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          border: Border.all(width: 1)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 80),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Event name",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "30 min, one-to-one",
                  style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'View booking page',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 0.1,
                    fontFamily: 'Montserrat',
                    color: Color(0xFFCABF3B).withOpacity(0.9),
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                    decorationColor: Color(0xFFCABF3B).withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color(0xFF787878).withOpacity(0.7)))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.copy,
                      size: 15,
                      color: Color(0xFF333333),
                    ),
                    Text(
                      "copy link",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 9),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 20,
                    width: 56,
                    decoration: BoxDecoration(
                        color: Color(0xFFE9D700).withOpacity(0.35),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1, color: Color(0xFF333333))),
                    child: const Center(
                      child: Text(
                        "Share",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 9),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final Size screenSize;
  //final String img;
  const AppBarWidgets({
    super.key,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    //Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "KH.",
            style: TextStyle(
                color: Color(0xFF000000),
                fontFamily: 'NEXT ART',
                fontWeight: FontWeight.w600,
                fontSize: 40),
          ),
          Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClickableWidget(
                onTap: () {
                  AuthorizationServices().signOut();
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Container(
                  height: 26,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Center(
                    child: Text(
                      'log out',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFE9D700),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(19),
                    color: Color(0xFFE9D700).withOpacity(0.25),
                  ),
                  child: const Center(
                    child: Text(
                      "A",
                      style: TextStyle(
                        color: Color(0xFFE9D700),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenSize.height / 7);
}
