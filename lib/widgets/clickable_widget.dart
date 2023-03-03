import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const ClickableWidget({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
