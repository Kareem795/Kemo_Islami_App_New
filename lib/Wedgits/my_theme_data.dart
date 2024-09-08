import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';

import '../utils/app_style.dart';

class MyThemeData 
{
  //! Light Theme
  static ThemeData ligthTheme = ThemeData
  (
    canvasColor: App_Colors.primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme
    (
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData
      (
        size: 30,
        color: App_Colors.accent,
      ),

      centerTitle: true,

      titleTextStyle: App_Style.AppBar_TextStyle
    ),

    dividerTheme: const DividerThemeData
    (
      color: App_Colors.primary, 
      thickness: 5
    ),

    iconTheme: const IconThemeData
    (
      size: 30,
      color: App_Colors.primary,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData
    (
      selectedItemColor: App_Colors.accent,
      unselectedItemColor: Colors.white,
      backgroundColor: App_Colors.primary
    ),

    textTheme: const TextTheme
    (
      bodySmall: TextStyle
      (
        color: App_Colors.accent,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      bodyMedium: TextStyle
      (
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: TextStyle
      (
        color: App_Colors.accent,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),

  );

  //! Dark Theme
  static ThemeData darkTheme = ThemeData
  (
    canvasColor: App_Colors.primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme
    (
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData
      (
        size: 30,
        color: Colors.white,
      ),

      centerTitle: true,

      titleTextStyle: App_Style.AppBar_TextStyle
    ),

    dividerTheme: const DividerThemeData
    (
      color: Color(0xFFF8CA1D), 
      thickness: 5
    ),

    iconTheme: const IconThemeData
    (
      size: 30,
      color: App_Colors.accentDark,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData
    (
      selectedItemColor: Color(0xFFF8CA1D),
      unselectedItemColor: Colors.white,
      backgroundColor: App_Colors.primaryDark
    ),

    textTheme: const TextTheme
    (
      bodySmall: TextStyle
      (
        color: App_Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      bodyMedium: TextStyle
      (
        color: App_Colors.accentDark,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: TextStyle
      (
        color: App_Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),

    
  );
}