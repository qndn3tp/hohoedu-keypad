import 'package:flutter/material.dart';
import 'package:get/get.dart';

//////////
// 로고 //
//////////
logoImage() {
  final screenSize = MediaQuery.of(Get.context!).size;   
  return SizedBox(
    height: screenSize.height * 0.15,
    child: Image.asset('assets/images/logo.png'),
  );
}