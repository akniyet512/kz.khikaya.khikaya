import 'package:flutter/material.dart';
import 'package:khikaya/utilities/constants.dart';
import 'package:khikaya/widgets/desktop_layout/header_widget.dart';

class SignInDesktopScaffold extends StatefulWidget {
  const SignInDesktopScaffold({super.key});

  @override
  State<SignInDesktopScaffold> createState() => _SignInDesktopScaffoldState();
}

class _SignInDesktopScaffoldState extends State<SignInDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
