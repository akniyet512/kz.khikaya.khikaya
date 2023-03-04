import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khikaya/utilities/utils.dart';
import 'package:scrolling_text/scrolling_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:marquee/marquee.dart';

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
  double _firstContainerHeight = 0;
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
            HorizontalMarqueeText(
                text: "University Name",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat')),
            // Padding(
            //   padding: const EdgeInsets.only(top: 55.0),
            //   child: Container(
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 68.0, right: 68),
            //       child: CarouselSlider.builder(
            //         itemCount: 2,
            //         itemBuilder: (BuildContext context, int itemIndex,
            //             int pageViewIndex) {
            //           final textInd = textList[itemIndex];
            //           return Container(
            //             width: 360,
            //             //margin: const EdgeInsets.symmetric(horizontal: 5),
            //             child: textInd,
            //           );
            //         },
            //         options: CarouselOptions(
            //           height: 50,
            //           aspectRatio: 0,
            //           viewportFraction: 0.2,
            //           initialPage: 0,
            //           autoPlay: true,
            //           reverse: true,
            //           autoPlayInterval: Duration(milliseconds: 1000),
            //           autoPlayAnimationDuration:
            //               const Duration(milliseconds: 1000),
            //           scrollDirection: Axis.horizontal,
            //           // onPageChanged: (index, reason) {
            //           //   setState(() => activeIndex = index);
            //           //   //print(activeIndex);
            //           // },
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
            const SizedBox(
              height: 60,
            ),
            Stack(
              children: [
                Row(
                  children: [
                    BlackContainer(
                      screenSize: screenSize,
                      imgUrl: "assets/images/idea-1.png.webp",
                    ),
                    BlackContainer(
                      screenSize: screenSize,
                      imgUrl: "assets/images/struct.jpg",
                    ),
                    BlackContainer(
                      screenSize: screenSize,
                      imgUrl: "assets/images/third_ad.webp",
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenSize.height / 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      TextDesign(text: "ideate"),
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          //grade: 0.2,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextDesign(text: "structurize"),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          //grade: 0.2,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextDesign(text: "direct"),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(
              height: screenSize.height / 6,
            ),
            TestimonialsWidget()

            // TestCards(
            //   imgUrl: 'assets/images/IMG_3065.jpg',
            //   text: "Bekdaulet  Ganibek",
            //   uni_name: "Columbia University",
            // )
          ],
        ),
      ),
    );
  }
}

class HorizontalMarqueeText extends StatelessWidget {
  final String text;
  final TextStyle style;

  HorizontalMarqueeText({required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 30),
      child: Container(
        height: 30.0,
        child: Marquee(
          text: text,
          style: style,
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20.0,
          velocity: 90.0,
          //pauseAfterRound: Duration(seconds: 1),
          startPadding: 10.0,
          //accelerationDuration: Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          //decelerationDuration: Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}

class TestimonialsWidget extends StatefulWidget {
  const TestimonialsWidget({super.key});

  @override
  State<TestimonialsWidget> createState() => _TestimonialsWidgetState();
}

class _TestimonialsWidgetState extends State<TestimonialsWidget> {
  int activeIndex = 0;
  final List<String> imgList = [
    'assets/images/IMG_3065.jpg',
    'assets/images/IMG_3054.jpg',
    'assets/images/IMG_3067.jpg',
    'assets/images/IMG_3065.jpg',
    'assets/images/IMG_3054.jpg',
    'assets/images/IMG_3067.jpg',
  ];
  final List<String> nameList = [
    "Bekdaulet  Ganibek",
    "Aziz Mussilimov",
    "Abildinova Kamila",
    "Bekdaulet  Ganibek",
    "Aziz Mussilimov",
    "Abildinova Kamila"
  ];
  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.only(top: 70),
    //   child: Column(
    //     children: [
    //       CarouselSlider.builder(
    //         itemCount: 3,
    //         itemBuilder:
    //             (BuildContext context, int itemIndex, int pageViewIndex) {
    //           final urlImage = imgList[itemIndex];
    //           final textIndex = nameList[itemIndex];
    //           return TestCards(
    //               imgUrl: urlImage,
    //               text: textIndex,
    //               uni_name: "Columbia University");
    //         },
    //         options: CarouselOptions(
    //           height: 200,
    //           aspectRatio: 16 / 9,
    //           viewportFraction: 0.35,
    //           initialPage: 0,
    //           autoPlay: true,
    //           reverse: false,
    //           autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //           scrollDirection: Axis.horizontal,
    //           onPageChanged: (index, reason) {
    //             setState(() => activeIndex = index);
    //             //print(activeIndex);
    //           },
    //         ),
    //       ),
    //       SizedBox(
    //         height: 50,
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      height: 200,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 30,
            );
          },
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final urlImage = imgList[index];
            final textIndex = nameList[index];
            return TestCards(
                imgUrl: urlImage,
                text: textIndex,
                uni_name: "Columbia University");
          }),
    );
  }
}

class TestCards extends StatelessWidget {
  final String imgUrl;
  final String text;
  final String uni_name;
  const TestCards(
      {super.key,
      required this.imgUrl,
      required this.text,
      required this.uni_name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 420,
        height: 130,
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(color: Colors.grey.shade500, width: 1))),
        //elevation: 0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Container(
                width: 170,
                //height: 130,
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                IconWithText(icon: Icons.book, text: uni_name),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 225,
                  //height: 100,
                  child: Text(
                    "“ Lorem ipsum dolor sit amet, ut scripserit disputando nam, per ea sale error impedit. Sea etiam dissentiunt ex, sea ea debet eripuitCu laoreet feugait ius, nullam option ornatus ad eos. No quaestio tractatos per. ”",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextDesign extends StatelessWidget {
  final String text;

  const TextDesign({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 28, fontFamily: 'NEXT ART'),
        ),
      ),
    );
  }
}

class BlackContainer extends StatelessWidget {
  final String imgUrl;
  const BlackContainer(
      {super.key, required this.screenSize, required this.imgUrl});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width / 3,
      height: screenSize.height / 2.6,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.81),
          BlendMode.srcATop,
        ),
        child: Image.asset(
          imgUrl,
          fit: BoxFit.fill,
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
