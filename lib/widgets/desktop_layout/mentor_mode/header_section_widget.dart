import 'package:flutter/material.dart';
import 'package:khikaya/services/authorization_services.dart';
import 'package:khikaya/utilities/constants.dart';
import 'package:khikaya/widgets/clickable_widget.dart';

class HeaderSectionWidget extends StatelessWidget {
  const HeaderSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "KH.",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'NEXT ART',
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          Row(
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
                      color: primaryColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(19),
                    color: primaryColor.withOpacity(0.25),
                  ),
                  child: const Center(
                    child: Text(
                      "A",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
