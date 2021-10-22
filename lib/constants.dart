import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff41B14F);
const kPrimaryLightColor = Color(0xffF1FDF8);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
Color kSecondaryColor = Colors.green[200];
Color kSecondaryDarkColor = Colors.green;
const kTextColor = Colors.white;
const kAnimationDuration = Duration(milliseconds: 200);

final kHeadingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: Colors.orange[900],
  // height: 1.5,
);
final kTableHeading = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: Colors.blue[800],
  // height: 1.5,
);

final kSeatsHeading = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: Colors.blue[800],
  // height: 1.5,
);

final kTimerStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: Colors.black,
  // height: 1.5,
);
