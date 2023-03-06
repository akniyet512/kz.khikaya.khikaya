import 'package:flutter/material.dart';
import 'package:khikaya/screens/admin_home_page/admin_home_desktop_scaffold.dart';
import 'package:khikaya/screens/admin_home_page/admin_home_mobile_scaffold.dart';
import 'package:khikaya/screens/admin_home_page/admin_home_tablet_scaffold.dart';
import 'package:khikaya/screens/error_page/error_desktop_scaffold.dart';
import 'package:khikaya/screens/error_page/error_mobile_scaffold.dart';
import 'package:khikaya/screens/error_page/error_tablet_scaffold.dart';
import 'package:khikaya/screens/forgot_password_page/forgot_password_desktop_scaffold.dart';
import 'package:khikaya/screens/forgot_password_page/forgot_password_mobile_scaffold.dart';
import 'package:khikaya/screens/forgot_password_page/forgot_password_tablet_scaffold.dart';
import 'package:khikaya/screens/landing_page/landing_desktop_scaffold.dart';
import 'package:khikaya/screens/landing_page/landing_mobile_scaffold.dart';
import 'package:khikaya/screens/landing_page/landing_tablet_scaffold.dart';
import 'package:khikaya/screens/mentor_home_page/mentor_home_desktop_scaffold.dart';
import 'package:khikaya/screens/mentor_home_page/mentor_home_mobile_scaffold.dart';
import 'package:khikaya/screens/mentor_home_page/mentor_home_tablet_scaffold.dart';
import 'package:khikaya/screens/sign_in_page/sign_in_desktop_scaffold.dart';
import 'package:khikaya/screens/sign_in_page/sign_in_mobile_scaffold.dart';
import 'package:khikaya/screens/sign_in_page/sign_in_tablet_scaffold.dart';
import 'package:khikaya/screens/sign_up_page/sign_up_desktop_scaffold.dart';
import 'package:khikaya/screens/sign_up_page/sign_up_mobile_scaffold.dart';
import 'package:khikaya/screens/sign_up_page/sign_up_tablet_scaffold.dart';
import 'package:khikaya/screens/user_home_page/user_home_desktop_scaffold.dart';
import 'package:khikaya/screens/user_home_page/user_home_mobile_scaffold.dart';
import 'package:khikaya/screens/user_home_page/user_home_tablet_scaffold.dart';
import 'package:khikaya/screens/verification_page/verification_desktop_scaffold.dart';
import 'package:khikaya/screens/verification_page/verification_mobile_scaffold.dart';
import 'package:khikaya/screens/verification_page/verification_tablet_scaffold.dart';
import 'package:khikaya/utilities/responsive_format.dart';

//screen sizes for responsiveness
const double mobileMaxWidth = 768;
const double tabletMaxWidth = 1080;

//colors
const Color backgroundColor = Colors.white;
const Color foregroundColor = Color(0xFF000000);
final Color backgroundLayer = Colors.black.withOpacity(0.81);

//layouts
const Widget landingPageLayout = ResponsiveLayout(
  mobileScaffold: LandingMobileScaffold(),
  tabletScaffold: LandingTabletScaffold(),
  desktopScaffold: LandingDesktopScaffold(),
);
const Widget userHomePageLayout = ResponsiveLayout(
  mobileScaffold: UserHomeMobileScaffold(),
  tabletScaffold: UserHomeTabletScaffold(),
  desktopScaffold: UserHomeDesktopScaffold(),
);
const Widget adminHomePageLayout = ResponsiveLayout(
  mobileScaffold: AdminHomeMobileScaffold(),
  tabletScaffold: AdminHomeTabletScaffold(),
  desktopScaffold: AdminHomeDesktopScaffold(),
);
const Widget mentorHomePageLayout = ResponsiveLayout(
  mobileScaffold: MentorHomeMobileScaffold(),
  tabletScaffold: MentorHomeTabletScaffold(),
  desktopScaffold: MentorHomeDesktopScaffold(),
);
const Widget signInPageLayout = ResponsiveLayout(
  mobileScaffold: SignInMobileScaffold(),
  tabletScaffold: SignInTabletScaffold(),
  desktopScaffold: SignInDesktopScaffold(),
);
const Widget signUpPageLayout = ResponsiveLayout(
  mobileScaffold: SignUpMobileScaffold(),
  tabletScaffold: SignUpTabletScaffold(),
  desktopScaffold: SignUpDesktopScaffold(),
);
const Widget forgotPasswordPageLayout = ResponsiveLayout(
  mobileScaffold: ForgotPasswordMobileScaffold(),
  tabletScaffold: ForgotPasswordTabletScaffold(),
  desktopScaffold: ForgotPasswordDesktopScaffold(),
);
const Widget errorPageLayout = ResponsiveLayout(
  mobileScaffold: ErrorMobileScaffold(),
  tabletScaffold: ErrorTabletScaffold(),
  desktopScaffold: ErrorDesktopScaffold(),
);
const Widget verificationPageLayout = ResponsiveLayout(
  mobileScaffold: VerificationMobileScaffold(),
  tabletScaffold: VerificationTabletScaffold(),
  desktopScaffold: VerificationDesktopScaffold(),
);
