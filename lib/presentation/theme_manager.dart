import 'package:flutter/material.dart';
import 'package:tableupp/presentation/color_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //app main color
    primaryColor: ColorManager.primary,
    //card view them
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: 4),

    //App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: 4,
      // shadowColor:
    ),

    //Button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorManager.primary,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    //Text theme
    // textTheme: TextTheme(headlineLarge: getSemi)

    //Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary),
          borderRadius: BorderRadius.circular(50),
        )),
  );
}
