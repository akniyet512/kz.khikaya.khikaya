import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  String get initialRoute {
    final auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      return '/';
    } else {
      return '/user-home';
    }
  }

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
        '/user-home': (context) => userHomePageLayout,
        '/admin-home': (context) => userHomePageLayout,
        '/mentor-home': (context) => userHomePageLayout,
      },
    );
  }
}
