import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/attendance/number_controller.dart';
import 'package:hoho_keypad/style.dart';

/////////////////
// 번호 텍스트 //
////////////////
Widget numberText() { 
  final screenSize = MediaQuery.of(Get.context!).size; 
  final numberController = Get.put(NumberController());
  const numberStyle = TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: PrimaryColors.textGrey);
  
  return SizedBox(
    height: screenSize.height * 0.3,
    width: screenSize.width * 0.7,
    child: Obx(() {
      final number = numberController.number.value;
      final numberLen = numberController.numberLen;
      // 가로로 번호 표시
      // 적당한 간격으로 보여주기 위해 중간번호-끝번호-구분번호로 SizedBox위젯을 이용
      // 문자열 슬라이싱을 이용해 실시간으로 키 입력이 반영되도록 함
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 중간 번호
          SizedBox(child: Text(number.substring(0, min(4, numberController.numberLen)), style: numberStyle)),
          // 끝 번호
          SizedBox(child: Text(number.substring(min(4, numberController.numberLen), min(8, numberController.numberLen)), style: numberStyle)),
          // 자녀 구분 번호
          SizedBox(child: Text(numberLen >= 8 ? numberController.number.substring(8) : '', style: numberStyle)),
        ],
      );
    }),
  );
}