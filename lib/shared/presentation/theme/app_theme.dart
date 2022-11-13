import 'package:flutter/material.dart';

import '../color/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        overline: overline,
        // button: button,
         bodyText1: bodyText1,
         bodyText2: bodyText2,
      ),
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  static const headline1 = TextStyle(
    fontSize: 26.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    letterSpacing: -0.17,
    color: AppColors.white,
  );
  static const headline2 = TextStyle(
    fontSize: 14.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    letterSpacing: -0.17,
    color: AppColors.black,
  );

  static const headline3 = TextStyle(
    fontSize: 10.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    letterSpacing: -0.17,
    color: AppColors.white,
  );
  static const headline4 = TextStyle(
    fontSize: 12.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
    letterSpacing: -0.17,
    color: AppColors.white,
  );
  static const overline = TextStyle(
    fontSize: 10.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    letterSpacing: -0.17,
    color: Color(0xFF999999),
  );

  static const subtitle1 = TextStyle(
    fontSize: 13.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
    letterSpacing: -0.17,
    color: AppColors.black,
  );

   static const subtitle2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
     letterSpacing: -0.17,
    color: AppColors.white,
  );
  static const bodyText1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
     letterSpacing: -0.17,
    color: AppColors.black,
  );

  static const bodyText2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
     letterSpacing: -0.17,
    color: AppColors.grey,
  );
}
