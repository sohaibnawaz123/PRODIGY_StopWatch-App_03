import 'package:flutter/material.dart';

class AppColor {
  static Color bgColor = const Color(0xFFf0f9ff);
  static Color appbarBGColor = const Color(0xFF0369a1);
  static Color textColor = const Color(0xFFfafafa);
  static Color textColor2 = const Color(0xFF0a0a0a);
  static Color headingColor = const Color(0xFF082f49);
  static Color buttonBGColor = const Color(0xFF0369a1);
}

TextStyle appHeading(Color color,double size,{FontWeight fontweight=FontWeight.w400}) {
    return TextStyle(
      fontFamily: 'Akaya',
      color:color,
      fontSize: size,
      fontWeight: fontweight
    );
  }
  TextStyle appText(Color color,double size,{FontWeight fontweight=FontWeight.w400}) {
    return TextStyle(
      fontFamily: 'Kodchasan-M',
      fontSize: size,
      color: color,
      fontWeight: fontweight
    );
  }
  TextStyle appTextRegular(Color color,double size,{FontWeight fontweight=FontWeight.w400}) {
    return TextStyle(
      fontFamily: 'Kodchasan-R',
      fontSize: size,
      color: color,
      fontWeight: fontweight
    );
  }

