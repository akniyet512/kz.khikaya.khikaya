import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final int maxLines;
  final double? height;
  final double? width;
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  
  const TextFieldWidget({
    super.key,
    this.height,
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.hintText,
    this.width,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: height,
          width: screenSize.width / 3,
          child: TextField(
            maxLines: maxLines,
            controller: controller,
            decoration: InputDecoration(
              fillColor: backgroundColor,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Color(0xFF787878).withOpacity(0.7), //TODO
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Color(0xFF787878).withOpacity(0.3), //TODO
                  width: 0.05,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}