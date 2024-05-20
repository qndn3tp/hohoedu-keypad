import 'package:flutter/material.dart';

class PrimaryColors{
  static const Color blue = Color(0xff4b54ff);
  static const Color orange = Color(0xfffd7024);
  static const Color green = Color(0xff0096a0);
  static const Color indigo = Color(0xff2933e1);
  static const Color purple = Color(0xff854fc8);
  static const Color yellow = Color(0xfffffff4);
  static const Color textGrey = Color(0xff393E46);
  static const Color grey1 = Color(0xfff7f7f7);
  static const Color grey2 = Color(0xffebebeb);
  static const Color grey3= Color(0xff5a5a5a);
}

ThemeData theme = ThemeData(
  // 배경색
  scaffoldBackgroundColor: Colors.white,

  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor:  Color(0xfff7f7f7),
  ),

  textTheme: const TextTheme(
    
  ),

);