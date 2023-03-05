import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';

class PhasesWidget extends StatelessWidget {
  const PhasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: screenSize.width / 3,
              height: screenSize.height / 2.6,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  backgroundLayer,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/idea-1.png.webp",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width / 3,
              height: screenSize.height / 2.6,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  backgroundLayer,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/struct.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width / 3,
              height: screenSize.height / 2.6,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  backgroundLayer,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/third_ad.webp",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenSize.height / 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 5),
              Center(
                child: Text(
                  "ideate".toUpperCase(),
                  style: const TextStyle(
                    color: backgroundColor,
                    fontSize: 28,
                    fontFamily: 'NEXT ART',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 90.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: backgroundColor,
                  size: 40,
                ),
              ),
              const SizedBox(width: 5),
              Center(
                child: Text(
                  "structurize".toUpperCase(),
                  style: const TextStyle(
                    color: backgroundColor,
                    fontSize: 28,
                    fontFamily: 'NEXT ART',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: backgroundColor,
                  size: 40,
                ),
              ),
              const SizedBox(width: 5),
              Center(
                child: Text(
                  "direct".toUpperCase(),
                  style: const TextStyle(
                    color: backgroundColor,
                    fontSize: 28,
                    fontFamily: 'NEXT ART',
                  ),
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        )
      ],
    );
  }
}
