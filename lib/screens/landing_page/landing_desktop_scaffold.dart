import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';
import 'package:khikaya/widgets/desktop_layout/header_widget.dart';
import 'package:khikaya/widgets/desktop_layout/landing_page/main_section_widget.dart';
import 'package:khikaya/widgets/desktop_layout/landing_page/phases_section_widget.dart';
import 'package:khikaya/widgets/desktop_layout/landing_page/testimonials_section_widget.dart';
import 'package:marquee/marquee.dart';

class LandingDesktopScaffold extends StatefulWidget {
  const LandingDesktopScaffold({super.key});

  @override
  State<LandingDesktopScaffold> createState() => _LandingDesktopScaffoldState();
}

class _LandingDesktopScaffoldState extends State<LandingDesktopScaffold> {
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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const HeaderWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainSectionWidget(),
            const SizedBox(height: 60),
            const PhasesWidget(),
            SizedBox(height: screenSize.height / 6),
            const TestimonialsSectionWidget(),
          ],
        ),
      ),
    );
  }
}
