import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';
import 'package:khikaya/widgets/clickable_widget.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClickableWidget(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1.5,
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Montserrat',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
