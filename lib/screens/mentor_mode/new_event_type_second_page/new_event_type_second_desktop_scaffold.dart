import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khikaya/utilities/constants.dart';
import 'package:khikaya/widgets/clickable_widget.dart';
import 'package:khikaya/widgets/custom_button.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/circle_color_widget.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/header_section_widget.dart';

class NewEventTypeSecondDesktopScaffold extends StatefulWidget {
  const NewEventTypeSecondDesktopScaffold({super.key});

  @override
  State<NewEventTypeSecondDesktopScaffold> createState() =>
      _NewEventTypeSecondDesktopScaffoldState();
}

class _NewEventTypeSecondDesktopScaffoldState
    extends State<NewEventTypeSecondDesktopScaffold> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _firstDateController = TextEditingController();
  final TextEditingController _secondDateController = TextEditingController();

  int selected = 0;
  var items = [
    '45',
    '60',
    '120',
    '160',
  ];
  late String dropdownvalue;
  @override
  void initState() {
    dropdownvalue = items[0];
    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();
    _firstDateController.dispose();
    _secondDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width / 12.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSectionWidget(),
              ClickableWidget(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  "< back",
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              //what event is this
              Container(
                width: screenSize.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 9,
                        top: 5,
                      ),
                      child: Row(
                        children: const [
                          CircleColorWidget(color: Color(0xFF16339D)), //TODO
                          SizedBox(width: 13),
                          Text(
                            "What event is this?",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 46),
                      child: Row(
                        children: [
                          Text(
                            "Event name , ",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF787878).withOpacity(0.7), //TODO
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                              width: 13,
                              height: 13,
                              child: Image.asset(
                                "assets/images/google-meet.webp",
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(width: 5),
                          Text(
                            "Google Meet",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF787878).withOpacity(0.7), //TODO
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: screenSize.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9, top: 5),
                      child: Row(
                        children: const [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 13),
                          Text(
                            "When can people book this event?",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 46.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "45 min, 60 rolling calendar days",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF787878).withOpacity(0.7), //TODO
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 0.7,
                      color: Colors.grey,
                    ),
                    //range section widget
                    Padding(
                      padding: const EdgeInsets.only(left: 46.0, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Data Range",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width / 4,
                                child: const Text(
                                  "Set a range of dates when you can accept meetings.",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Color(0xFF787878), //TODO
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Invitees can schedule...",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 9,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.only(left: 0),
                                leading: Radio(
                                  value: 1,
                                  groupValue: selected,
                                  onChanged: (int? i) {
                                    setState(() {
                                      selected = i!;
                                    });
                                  },
                                ),
                                subtitle: Row(
                                  children: [
                                    RangeFields(
                                      controller: _valueController,
                                      width: 52,
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("days"),
                                  ],
                                ),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.only(left: 0),
                                leading: Radio(
                                  value: 2,
                                  groupValue: selected,
                                  onChanged: (int? i) {
                                    setState(() {
                                      selected = i!;
                                    });
                                  },
                                ),
                                subtitle: Row(
                                  children: [
                                    const Text(
                                      "Within a date",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RangeFields(
                                      controller: _firstDateController,
                                      width: 140,
                                      height: 35,
                                    ),
                                    RangeFields(
                                      controller: _secondDateController,
                                      width: 140,
                                      height: 35,
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.only(left: 0),
                                title: const Text(
                                  "Indefinitely into the future",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                                leading: Radio(
                                  value: 3,
                                  groupValue: selected,
                                  onChanged: (int? i) {
                                    setState(() {
                                      selected = i!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 0.7,
                      color: Colors.grey,
                    ),
                    //duration section widget
                    Padding(
                      padding: const EdgeInsets.only(left: 46.0, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Duration",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 35.0),
                                child: SizedBox(
                                  width: screenSize.width / 4.5,
                                  child: const Text(
                                    "Define how long your event will be. It can be as long as 12 hours.",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Color(0xFF787878),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //dropdown
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            width: 145,
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xFF787878).withOpacity(0.9),
                                    width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    style: const TextStyle(
                                      //color: widget.color,

                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    isExpanded: true,
                                    //menuMaxHeight: 15,
                                    //itemHeight: 15,
                                    borderRadius: BorderRadius.circular(10),
                                    value: dropdownvalue,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFFCABF3B),
                                    ),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 0.7,
                      color: Colors.grey,
                    ),
                    ScheduleWidget(),
                    const SizedBox(height: 35),
                    Container(
                      height: 0.7,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 10),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 15),
                          child: Row(
                            children: [
                              ClickableWidget(
                                onTap: () {},
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                height: 32,
                                width: 70,
                                text: "Submit",
                                onTap: () async {
                                  late DateTime eventTypeStartDate;
                                  late DateTime eventTypeEndDate;

                                  if (selected == 1) {
                                    int? value =
                                        int.tryParse(_valueController.text);
                                    if (value == null) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text("Error"),
                                          content: Text("put number"),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: Text("OK"),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      eventTypeStartDate = DateTime.now();
                                      eventTypeEndDate = DateTime.now().add(
                                        Duration(
                                          days: value,
                                        ),
                                      );
                                    }
                                  } else if (selected == 2) {
                                    DateFormat format =
                                        DateFormat("dd/MM/yyyy");
                                    eventTypeStartDate =
                                        format.parse(_firstDateController.text);
                                    eventTypeEndDate = format
                                        .parse(_secondDateController.text);
                                  } else if (selected == 3) {
                                    eventTypeStartDate = DateTime.now();
                                    eventTypeEndDate = DateTime.now()
                                        .add(Duration(days: 10000));
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Error"),
                                        content: Text("Choose date"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text("OK"),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('eventTypes')
                                      .doc()
                                      .set({
                                    "eventName": args["name"],
                                    "eventLink": args["link"],
                                    "eventColor": args["color"],
                                    "description": args["description"],
                                    "startDate": eventTypeStartDate,
                                    "endDate": eventTypeEndDate,
                                    "duration": int.parse(dropdownvalue),
                                    "created": DateTime.now(),
                                  });
                                  if (mounted) return;
                                  Navigator.of(context)
                                      .pushReplacementNamed('/mentor-home');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  var items = ['Almaty City Time'];
  late String dropdownvalue;
  @override
  void initState() {
    dropdownvalue = items[0];
    super.initState();
  }

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 46.0,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "How do you want to offer your availability for this event type?",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: screenSize.width / 1.31,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "TIME ZONE",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      //dropdown
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: 145,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF787878).withOpacity(0.9),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                value: dropdownvalue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFFCABF3B),
                                ),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 0.7,
                  color: Colors.grey,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      FirstHalf(
                        startController: startController,
                        endController: endController,
                      ),
                      VerticalDivider(
                        color: Color(0xFF787878).withOpacity(0.7),
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Add date overrides",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: screenSize.width / 5,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.6),
                                ),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Center(
                                child: Text(
                                  "Add a date override",
                                  style: TextStyle(
                                    color: primaryColor.withOpacity(0.6),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 26),
                            HistoryData(
                              date: "11 Mar 2023",
                              availableTime: "09:00 - 17:00",
                              topBordered: true,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HistoryData extends StatelessWidget {
  final String date;
  final String availableTime;
  final bool? topBordered;
  const HistoryData(
      {super.key,
      required this.date,
      required this.availableTime,
      this.topBordered = false});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: screenSize.width / 3.5,
      height: 46,
      decoration: topBordered!
          ? BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.29), width: 0.8),
                  bottom: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.29), width: 0.8)),
            )
          : BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.29), width: 0.8)),
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 13),
          ),
          Row(
            children: [
              Text(
                availableTime,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Colors.black),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete,
                      size: 15, color: Color(0xFF333333).withOpacity(0.72)))
            ],
          )
        ],
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    super.key,
    required this.startController,
    required this.endController,
  });

  final TextEditingController startController;
  final TextEditingController endController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Set your week hours",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 11),
          ),
          const SizedBox(
            height: 30,
          ),
          WeekDays(
            topBordered: true,
            text: "SUN",
            start: startController,
            end: endController,
            isNotAvailable: true,
          ),
          WeekDays(
            topBordered: false,
            text: "MON",
            start: startController,
            end: endController,
            isNotAvailable: false,
          ),
          WeekDays(
            topBordered: false,
            text: "TUE",
            start: startController,
            end: endController,
            isNotAvailable: false,
          ),
          WeekDays(
            topBordered: false,
            text: "WED",
            start: startController,
            end: endController,
            isNotAvailable: false,
          ),
          WeekDays(
            topBordered: false,
            text: "THU",
            start: startController,
            end: endController,
            isNotAvailable: false,
          ),
          WeekDays(
            topBordered: false,
            text: "FRI",
            start: startController,
            end: endController,
            isNotAvailable: false,
          ),
          WeekDays(
            topBordered: false,
            text: "SAT",
            start: startController,
            end: endController,
            isNotAvailable: true,
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class WeekDays extends StatelessWidget {
  final String text;
  final bool topBordered;
  final TextEditingController start;
  final TextEditingController end;
  final bool isNotAvailable;
  const WeekDays(
      {super.key,
      required this.text,
      required this.start,
      required this.end,
      required this.isNotAvailable,
      required this.topBordered});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: screenSize.width / 2.5,
      height: 46,
      decoration: topBordered
          ? BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.29), width: 0.8),
                  bottom: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.29), width: 0.8)),
            )
          : BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.29), width: 0.8)),
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
          isNotAvailable
              ? const Text(
                  "Unavailable",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 11),
                )
              : Row(
                  children: [
                    RangeFields(
                      controller: start,
                      width: 80,
                      height: 30,
                    ),
                    const Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 15,
                    ),
                    RangeFields(
                      controller: end,
                      width: 80,
                      height: 30,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 18,
                          color: Color(0xFF333333).withOpacity(0.50),
                        ))
                  ],
                ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 18,
              color: Color(0xFF333333).withOpacity(0.72),
            ),
          ),
        ],
      ),
    );
  }
}

class RangeFields extends StatefulWidget {
  final double? height;
  final double? width;
  final TextEditingController controller;
  final String? hintText;
  const RangeFields(
      {super.key,
      this.height,
      this.width,
      required this.controller,
      this.hintText});

  @override
  State<RangeFields> createState() => _RangeFieldsState();
}

class _RangeFieldsState extends State<RangeFields> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      width: widget.width,
      child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            fillColor: backgroundColor,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: Color(0xFF787878).withOpacity(0.7),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 13),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color(0xFF787878).withOpacity(0.3), width: 0.05)),
          )),
    );
  }
}
