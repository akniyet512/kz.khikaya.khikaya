import 'package:flutter/material.dart';
import 'package:khikaya/widgets/clickable_widget.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Check your email and verify your account."),
            ClickableWidget(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/sign-in');
              },
              child: const Text("Go back to login"),
            ),
          ],
        ),
      ),
    );
  }
}
