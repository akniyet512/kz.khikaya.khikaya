import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';

class MyCalendarSectionWidget extends StatelessWidget {
  const MyCalendarSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 3),
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
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "event type".toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'NEXT ART',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 55),
                        Text(
                          "Scheduled event".toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'NEXT ART',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 1.2,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}