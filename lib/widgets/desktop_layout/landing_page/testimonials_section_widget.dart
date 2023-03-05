import 'package:flutter/material.dart';
import 'package:khikaya/widgets/desktop_layout/landing_page/testimonials_item_widget.dart';

class TestimonialsSectionWidget extends StatefulWidget {
  const TestimonialsSectionWidget({super.key});

  @override
  State<TestimonialsSectionWidget> createState() =>
      _TestimonialsSectionWidgetState();
}

class _TestimonialsSectionWidgetState extends State<TestimonialsSectionWidget> {
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
    return SizedBox(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 30,
          );
        },
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final urlImage = imgList[index];
          final textIndex = nameList[index];
          return TestimonialsItemWidget(
            imageUrl: urlImage,
            name: textIndex,
            university: "Colombia University",
            quote:
                "Lorem ipsum dolor sit amet, ut scripserit disputando nam, per ea sale error impedit. Sea etiam dissentiunt ex, sea ea debet eripuitCu laoreet feugait ius, nullam option ornatus ad eos. No quaestio tractatos per.",
          );
        },
      ),
    );
  }
}

