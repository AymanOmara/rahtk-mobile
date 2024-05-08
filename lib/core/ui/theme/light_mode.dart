import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';

double _radius = 50;
ThemeData lightTheme = ThemeData(
  progressIndicatorTheme:const ProgressIndicatorThemeData(
    color: RahtkColors.tealColor,
    refreshBackgroundColor: Colors.white,
  ),
  indicatorColor: Colors.white,
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: _border,
    enabledBorder: _border,
    focusedBorder: _border,
    errorBorder: _border,
    disabledBorder: _border,
    contentPadding: const EdgeInsetsDirectional.only(
      start: 20,
      top: 20,
      bottom: 20,
    ),
    focusedErrorBorder: _border,
    outlineBorder: const BorderSide(
      color: Colors.white,
      width: 1,
    ),
    hintStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
  ),
);
var _border = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(
      _radius,
    ),
  ),
  borderSide: const BorderSide(
    color: Colors.white,
  ),
);
