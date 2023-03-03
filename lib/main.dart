import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khikaya/firebase_options.dart';
import 'package:khikaya/utilities/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => landingPageLayout,
        '/sign-in': (context) => signInPageLayout,
        '/sign-up': (context) => signUpPageLayout,
        '/forgot-password': (context) => forgotPasswordPageLayout,
        '/error': (context) => errorPageLayout,
        '/verification': (context) => verificationPageLayout,
      },
    );
  }
}
