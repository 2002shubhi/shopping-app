import 'package:flutter/material.dart';

class ColorMe {
  static const Color Lemon = Color(0xFFFAF0CA);
  static const Color lightorange = Color(0xFFFF825C);
  static const Color grey = Color(0xFF46494C);
  static const Color cadetgrey = Color(0xFF8D98A7);
  static const Color darklemon = Color(0xFFF3DB7C);
}

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: 'Poppins',
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black45 ),
        textTheme: Theme.of(context).textTheme,


      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
  );
}