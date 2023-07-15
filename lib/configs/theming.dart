import 'package:assignment_pepper/configs/colors.dart';
import 'package:assignment_pepper/configs/fonts.dart';
import 'package:flutter/material.dart';
class Theming{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: lightText,
    ),
    textTheme: const TextTheme(
      bodyLarge: bodyLargeText,
      bodyMedium: bodyMediumText,
      labelMedium: lightText,
      bodySmall: lightText,
      labelLarge: lightText,
      labelSmall: lightText,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: AppColors.whiteGrey),
  );

  static const TextStyle lightText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.circularStd,
  );

  static const TextStyle bodyLargeText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.circularStd,
    fontSize: 24
  );
  static const TextStyle bodyMediumText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.circularStd,
    fontSize: 16,
  );
  static const TextStyle bodySmallSize = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.circularStd,
    fontSize: 14,
  );
}