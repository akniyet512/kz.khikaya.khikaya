import 'package:flutter/material.dart';
import 'package:khikaya/widgets/clickable_widget.dart';
import 'package:khikaya/widgets/custom_button.dart';

class VerificationDesktopScaffold extends StatefulWidget {
  const VerificationDesktopScaffold({super.key});

  @override
  State<VerificationDesktopScaffold> createState() =>
      _VerificationDesktopScaffoldState();
}

class _VerificationDesktopScaffoldState
    extends State<VerificationDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenSize.width * 0.5,
              child: const Text(
                "Check your email, verify your account and try to login.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NEXT ART',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  fontSize: 36,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              height: 40,
              width: 160,
              text: "Go back to login",
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('/sign-in'),
            ),
          ],
        ),
      ),
    );
  }
}
