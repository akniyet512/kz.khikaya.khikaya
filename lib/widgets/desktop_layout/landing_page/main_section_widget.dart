import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';
import 'package:khikaya/widgets/clickable_widget.dart';
import 'package:khikaya/widgets/desktop_layout/landing_page/carousel_item_widget.dart';
import 'package:marquee/marquee.dart';

class MainSectionWidget extends StatefulWidget {
  const MainSectionWidget({super.key});

  @override
  State<MainSectionWidget> createState() => _MainSectionWidgetState();
}

class _MainSectionWidgetState extends State<MainSectionWidget> {
  int activeIndex = 0;
  final List<String> imgList = [
    'assets/images/IMG_3053.jpg',
    'assets/images/IMG_3054.jpg',
    'assets/images/IMG_3055.jpg',
    'assets/images/IMG_3055.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Column(
        children: [
          const Center(
            child: Text(
              "We Build Stories",
              style: TextStyle(
                fontFamily: 'NEXT ART',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                fontSize: 90,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 55,
              vertical: 30,
            ),
            child: SizedBox(
              height: 30.0,
              child: Marquee(
                text: "University Name",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 90.0,
                startPadding: 10.0,
                accelerationCurve: Curves.linear,
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Row(
              children: [
                ClickableWidget(
                  onTap: () {},
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: CarouselSlider.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      final urlImage = imgList[itemIndex];
                      return CarouselItemWidget(
                        name: "Aziz Mussilimov",
                        imageUrl: urlImage,
                        location: "Almaty, Kazakhstan",
                        experience: 4,
                        university: "UC Berkeley and Columbia University",
                      );
                    },
                    options: CarouselOptions(
                      height: screenSize.height,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.25,
                      initialPage: 0,
                      autoPlay: true,
                      reverse: false,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() => activeIndex = index);
                      },
                    ),
                  ),
                ),
                ClickableWidget(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
