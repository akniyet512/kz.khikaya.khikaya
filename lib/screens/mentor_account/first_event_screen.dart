import 'package:flutter/material.dart';
import 'package:khikaya/screens/mentor_account/mentor_account_page.dart';

class FirstEventScreen extends StatefulWidget {
  const FirstEventScreen({super.key});

  @override
  State<FirstEventScreen> createState() => _FirstEventScreenState();
}

class _FirstEventScreenState extends State<FirstEventScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets(screenSize: screenSize),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenSize.width / 12),
              child: GestureDetector(
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
            ),
            const SizedBox(
              height: 20,
            ),
            EventWidget()
          ],
        ),
      ),
    );
  }
}

class EventWidget extends StatefulWidget {
  const EventWidget({
    super.key,
  });

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: screenSize.width / 1.2,
        //height: screenSize.height / 1.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(width: 1, color: Color(0xFF000000)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 5),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorStyle(color: Color(0xFF16339D)),
                  const SizedBox(
                    width: 10,
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
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
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
                      const CustomButton(height: 34, width: 80, text: "Next")
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 0.7,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 35),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldWidget(
                    maxLines: 1,
                    height: 38,
                    title: "Event Name*",
                    controller: nameController,
                  ),
                  TextFieldWidget(
                    maxLines: 1,
                    height: 38,
                    title: "Location",
                    controller: locationController,
                    hintText: "add a location",
                  ),
                  TextFieldWidget(
                    maxLines: 6,
                    //height: 40,
                    title: "Description/Instructions",
                    controller: descriptionController,
                  ),
                  TextFieldWidget(
                    maxLines: 1,
                    height: 38,
                    hintText: "add a link",
                    title: "Event Link",
                    controller: linkController,
                  ),
                  const Text(
                    "Event Color",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: screenSize.width / 3,
                      //color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColorStyle(color: Color(0xFFF57272)),
                          ColorStyle(color: Color(0xFFE9D700)),
                          ColorStyle(color: Color(0xFF33BA61)),
                          ColorStyle(color: Color(0xFFF484F0)),
                          ColorStyle(color: Color(0xFF85D7FA)),
                          ColorStyle(color: Color(0xFF16339D)),
                          ColorStyle(color: Color(0xFF10411B)),
                          ColorStyle(color: Color(0xFF947445)),
                          ColorStyle(color: Color(0xFF662970)),
                          // ColorStyle(color: Colors.purpleAccent),
                          // ColorStyle(color: Colors.pinkAccent),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              height: 0.7,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
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
                      const CustomButton(height: 34, width: 80, text: "Next")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final double? height;
  final double? width;
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  const TextFieldWidget(
      {super.key,
      this.height,
      required this.title,
      required this.controller,
      this.obscureText = false,
      this.hintText,
      this.width,
      required this.maxLines});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      //mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: widget.height,
          width: screenSize.width / 3,
          child: TextField(
              maxLines: widget.maxLines,
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
                        color: Color(0xFF787878).withOpacity(0.3),
                        width: 0.05)),
              )),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

Widget ColorStyle({required Color color}) {
  return Container(
    height: 24,
    width: 24,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
  );
}
