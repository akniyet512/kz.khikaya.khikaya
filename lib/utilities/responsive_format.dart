import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileMaxWidth) {
          return mobileScaffold;
        } else if (constraints.maxWidth < tabletMaxWidth) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
