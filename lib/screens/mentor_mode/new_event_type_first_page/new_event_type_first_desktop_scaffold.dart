import 'package:flutter/material.dart';
import 'package:khikaya/widgets/clickable_widget.dart';
import 'package:khikaya/widgets/custom_button.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/circle_color_widget.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/header_section_widget.dart';
import 'package:khikaya/widgets/desktop_layout/mentor_mode/textfield_widget.dart';

class NewEventTypeFirstDesktopScaffold extends StatefulWidget {
  const NewEventTypeFirstDesktopScaffold({super.key});

  @override
  State<NewEventTypeFirstDesktopScaffold> createState() =>
      _NewEventTypeFirstDesktopScaffoldState();
}

class _NewEventTypeFirstDesktopScaffoldState
    extends State<NewEventTypeFirstDesktopScaffold> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSectionWidget(),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width / 12),
              child: ClickableWidget(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  "< back",
                  style: TextStyle(
                    color: Color(0xFF787878), //TODO
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
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
                        left: 6,
                        top: 5,
                      ),
                      child: Row(
                        children: const [
                          CircleColorWidget(color: Color(0xFF16339D)), //TODO
                          SizedBox(width: 10),
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
                    const SizedBox(height: 12),
                    Container(
                      height: 0.7,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        top: 35,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFieldWidget(
                            maxLines: 1,
                            height: 38,
                            title: "Event Name*",
                            controller: _nameController,
                          ),
                          TextFieldWidget(
                            maxLines: 1,
                            height: 38,
                            title: "Location",
                            controller: _locationController,
                            hintText: "add a location",
                          ),
                          TextFieldWidget(
                            maxLines: 6,
                            title: "Description/Instructions",
                            controller: _descriptionController,
                          ),
                          TextFieldWidget(
                            maxLines: 1,
                            height: 38,
                            hintText: "add a link",
                            title: "Event Link",
                            controller: _linkController,
                          ),
                          const Text(
                            "Event Color",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: screenSize.width / 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CircleColorWidget(
                                      color: Color(0xFFF57272)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFFE9D700)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFF33BA61)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFFF484F0)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFF85D7FA)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFF16339D)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFF10411B)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFF947445)), //TODO
                                  CircleColorWidget(
                                      color: Color(0xFF662970)), //TODO
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              GestureDetector(
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
                                height: 34,
                                width: 80,
                                text: "Next",
                                onTap: () => Navigator.of(context).pushNamed(
                                  '/new-event-type-second',
                                  arguments: {
                                    "name": _nameController.text,
                                    "link": _linkController.text,
                                    "color": "pink",
                                    "description": _descriptionController.text,
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
