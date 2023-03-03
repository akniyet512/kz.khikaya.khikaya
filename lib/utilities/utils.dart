import 'package:flutter/material.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromView(WidgetsBinding.instance.window).size;
  }
}
