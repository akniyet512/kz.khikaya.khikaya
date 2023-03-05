import 'package:flutter/material.dart';
import 'package:khikaya/screens/mentor_account/first_event_screen.dart';
import 'package:khikaya/screens/mentor_account/mentor_account_page.dart';

class SecondEvent extends StatefulWidget {
  const SecondEvent({super.key});

  @override
  State<SecondEvent> createState() => _SecondEventState();
}

class _SecondEventState extends State<SecondEvent> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets(screenSize: screenSize),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width / 12.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "< back",
                  style: TextStyle(
                      color: Color(0xFF787878),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              EventContainer(screenSize: screenSize),
              SizedBox(
                height: 5,
              ),
              BookingDetails()
            ],
          ),
        ),
      ),
    );
  }
}

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(width: 1, color: Color(0xFF000000)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9, top: 5),
            child: Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(
                  width: 13,
                ),
                const Text(
                  "When can people book this event?",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "45 min, 60 rolling calendar days",
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF787878).withOpacity(0.7)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomButton(height: 32, width: 70, text: "Next")
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 0.7,
            color: Colors.grey,
          ),
          RangeWidget(),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 0.7,
            color: Colors.grey,
          ),
          DurationWidget(),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 0.7,
            color: Colors.grey,
          ),
          ScheduleWidget(),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 0.7,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CustomButton(height: 32, width: 70, text: "Next")
                  ],
                ),
              ),
            ],
          ),
        ],
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
  var items = ['East Kazakhstan Time', 'Almaty City Time'];
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(left: 46.0, top: 20),
        child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "How do you want to offer your availability for this event type?",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 11),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Container(
            width: screenSize.width / 1.31,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF000000), width: 1)),
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
                              color: Colors.black),
                        ),
                      ),
                      DropDownWidget(
                        list: items,
                        isDecorated: false,
                      )
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
                          endController: endController),
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
                                  fontSize: 11),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: screenSize.width / 5,
                              height: 25,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color(0xFFE9D700).withOpacity(0.6)),
                                  borderRadius: BorderRadius.circular(35)),
                              child: Center(
                                child: Text(
                                  "Add a date override",
                                  style: TextStyle(
                                      color: Color(0xFFE9D700).withOpacity(0.6),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            HistoryData(
                              date: "11 Mar 2023",
                              availableTime: "09:00 - 17:00",
                              topBordered: true,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //will be divided from here
              ],
            ),
          )
        ])));
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

class DurationWidget extends StatefulWidget {
  const DurationWidget({super.key});

  @override
  State<DurationWidget> createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {
  var items = [
    '45 min',
    '60 min',
    '120 min',
    '160 min',
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(left: 46.0, top: 10),
        child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Duration",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 11),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: Container(
                  width: screenSize.width / 4.5,
                  child: const Text(
                    "Define how long your event will be. It can be as long as 12 hours.",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xFF787878)),
                  ),
                ),
              )
            ],
          ),
          DropDownWidget(
            list: items,
            isDecorated: true,
          )
        ])));
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
                        color: Color(0xFF333333).withOpacity(0.29),
                        width: 0.8)),
              )
            : BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(0xFF333333).withOpacity(0.29),
                        width: 0.8)),
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              child: Text(
                text,
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 13),
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
                ))
          ],
        ));
  }
}

class DropDownWidget extends StatefulWidget {
  final List<String> list;
  final bool isDecorated;
  //final Color? color;
  const DropDownWidget({
    super.key,
    required this.list,
    required this.isDecorated,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  // List of items in our dropdown menu

  late String dropdownvalue = widget.list[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 145,
      //height: 20,

      decoration: widget.isDecorated
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color(0xFF787878).withOpacity(0.9), width: 1))
          : BoxDecoration(),
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
              items: widget.list.map((String items) {
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
    );
  }
}

class RangeWidget extends StatefulWidget {
  const RangeWidget({
    super.key,
  });

  @override
  State<RangeWidget> createState() => _RangeWidgetState();
}

class _RangeWidgetState extends State<RangeWidget> {
  TextEditingController valueController = TextEditingController();
  TextEditingController calendarController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    valueController.dispose();
    calendarController.dispose();
    dateController.dispose();
    super.dispose();
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 46.0, top: 10),
      child: Container(
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
                      fontSize: 11),
                ),
                Container(
                  width: screenSize.width / 4,
                  child: const Text(
                    "Set a range of dates when you can accept meetings.",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xFF787878)),
                  ),
                )
              ],
            ),
            const Text(
              "Invitees can schedule...",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 9),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  //title: Text("None"),
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
                        controller: valueController,
                        width: 52,
                        height: 35,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RangeFields(
                        controller: calendarController,
                        width: 140,
                        height: 35,
                      )
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  //title: Text("None"),
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
                      const Text("Within a date",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 12)),
                      const SizedBox(
                        width: 10,
                      ),
                      RangeFields(
                        controller: dateController,
                        width: 140,
                        height: 35,
                      )
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 0,
                  ),
                  title: const Text("Indefinitely into the future",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 12)),
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
            fillColor: Colors.white,
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

Widget EventContainer({required Size screenSize}) {
  return Container(
    width: screenSize.width / 1.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      border: Border.all(width: 1, color: Color(0xFF000000)),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9, top: 5),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorStyle(color: Color(0xFF16339D)),
              const SizedBox(
                width: 13,
              ),
              const Text(
                "What event is this?",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 46),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Event name , ",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF787878).withOpacity(0.7)),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                  width: 13,
                  height: 13,
                  child: Image.asset(
                    "assets/images/google-meet.webp",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 5,
              ),
              Text("Google Meet",
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF787878).withOpacity(0.7)))
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    ),
  );
}
