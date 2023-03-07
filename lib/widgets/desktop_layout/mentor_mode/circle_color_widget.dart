import 'package:flutter/material.dart';

class CircleColorWidget extends StatelessWidget {
  final Color color;
  const CircleColorWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}