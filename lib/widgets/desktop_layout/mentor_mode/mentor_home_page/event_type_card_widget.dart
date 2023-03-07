import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';

class EventTypeCardWidget extends StatelessWidget {
  final String name;
  final String duration;
  const EventTypeCardWidget({
    super.key,
    required this.name,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 132,
        width: 230,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 0.5,
            ),
          ],
          borderRadius: BorderRadius.circular(4),
          color: backgroundColor,
          border: Border.all(width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "$duration min, one-to-one",
                    style: const TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'View booking page',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.1,
                      fontFamily: 'Montserrat',
                      color: primaryColor.withOpacity(0.9),
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                      decorationColor: primaryColor.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF787878).withOpacity(0.7), //TODO
                  ),
                ),
              ),
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
                        color: Color(0xFF333333), //TODO
                      ),
                      Text(
                        "copy link",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 20,
                      width: 56,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF333333), //TODO
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Share",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
