import 'package:flutter/material.dart';
import 'package:get/get.dart';

//////////
// 로고 //
//////////
logoImage() {
  final screenHeight = MediaQuery.of(Get.context!).size.height;   
  return Container(
    margin: EdgeInsets.only(top: screenHeight * 0.05),
    height: screenHeight * 0.2,
    child: Image.asset('assets/images/logo.png'),
  );
}