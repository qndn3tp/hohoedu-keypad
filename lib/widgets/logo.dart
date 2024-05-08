import 'package:flutter/material.dart';

//////////
// 로고 //
//////////
logoImage(screenSize) {
  return SizedBox(
    height: screenSize.height * 0.15,
    child: Image.asset('assets/images/logo.png'),
  );
}