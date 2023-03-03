import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khikaya/utilities/utils.dart';
import 'package:marquee/marquee.dart';
import 'package:scrolling_text/scrolling_text.dart';
import 'package:flutter/cupertino.dart';

class LandingDesktopScaffold extends StatefulWidget {
  const LandingDesktopScaffold({super.key});

  @override
  State<LandingDesktopScaffold> createState() => _LandingDesktopScaffoldState();
}

class _LandingDesktopScaffoldState extends State<LandingDesktopScaffold> {
  final CarouselController _carouselController = CarouselController();
  int activeIndex = 0;

  final List<String> imgList = [
    'assets/images/IMG_3053.jpg',
    'assets/images/IMG_3054.jpg',
    'assets/images/IMG_3055.jpg',
  ];
  final List<Text> textList = [
    const Text(
      "University Name",
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
    ),
    Text(
      "University Name".toUpperCase(),
      style: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Montserrat'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height / 9,
            ),
            const Center(
              child: Text(
                "We Build Stories",
                style: TextStyle(
                    fontFamily: 'NEXT ART',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    fontSize: 90,
                    color: Color(0xFF000000)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 55.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 68.0, right: 68),
                  child: CarouselSlider.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      final textInd = textList[itemIndex];
                      return Container(
                        width: 360,
                        //margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: textInd,
                      );
                    },
                    options: CarouselOptions(
                      height: 50,
                      aspectRatio: 0,
                      viewportFraction: 0.2,
                      initialPage: 0,
                      autoPlay: true,
                      reverse: true,
                      autoPlayInterval: Duration(milliseconds: 1000),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                      scrollDirection: Axis.horizontal,
                      // onPageChanged: (index, reason) {
                      //   setState(() => activeIndex = index);
                      //   //print(activeIndex);
                      // },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      final urlImage = imgList[itemIndex];
                      return CardWidget(
                        imgUrl: urlImage,
                        //width: 360,
                        //margin: const EdgeInsets.symmetric(horizontal: 5),
                      );
                    },
                    options: CarouselOptions(
                      height: screenSize.height,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.38,
                      initialPage: 0,
                      autoPlay: true,
                      reverse: false,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() => activeIndex = index);
                        //print(activeIndex);
                      },
                    ),
                  ),
                ),
              ],
            ),
            //CardWidget(imgUrl: imgList[0])
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String imgUrl;
  const CardWidget({
    super.key,
    required this.imgUrl,
    //required this.screenSize,
  });

  //final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Container(
            // width: screenSize.width / 5.2,
            // height: screenSize.height / 1.8,
            width: 320,
            height: 400,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: 320,
            //height: screenSize.height / 2.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Text(
                    "•  Aziz Mussilimov",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ),
                IconWithText(
                    icon: Icons.location_on, text: "Almaty, Kazakhstan"),
                IconWithText(
                    icon: Icons.explore, text: "4 years of experience"),
                IconWithText(
                    icon: Icons.book,
                    text: "UC Berkeley and Columbia University"),
                Padding(
                  padding: const EdgeInsets.only(top: 17.0),
                  child: Container(
                    width: 320,
                    height: 35,
                    child: Center(
                      child: Text(
                        "Book",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconWithText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 18,
          ),
          const SizedBox(
            width: 1,
          ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Container(
        color: Colors.white,
        width: screenSize.width,
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
            Container(
              //padding: EdgeInsets.only(right: 30),
              height: 26,
              width: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(7)),
              child: const Center(
                child: Text(
                  'login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
