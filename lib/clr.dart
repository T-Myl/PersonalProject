import 'package:flutter/material.dart';

const Color bluishClr = Color(0xFF483580);
const Color yellowClr = Color(0xFFFFb746);
const Color pinkClr = Color(0xFFff4667);
const Color primaryClr = bluishClr;
const Color darkGreyClr = Color(0xff424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dart =
      ThemeData(primaryColor: darkGreyClr, brightness: Brightness.dark);
}
