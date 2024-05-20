import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/attendance/number_controller.dart';
import 'package:hoho_keypad/style.dart';

/////////////////
// 번호 텍스트 //
////////////////
numberText(screenSize) { 
  // 전화번호 컨트롤러
  final numberController = Get.put(NumberController());
  // 숫자 텍스트 스타일
  const numberStyle = TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: PrimaryColors.textGrey);
  
  return SizedBox(
    height: screenSize.height * 0.3,
    width: screenSize.width * 0.7,
    // 키패드 입력에 따라 위젯을 실시간으로 업데이트
    child: Obx(
      () {
        final number = numberController.number;
        final numberLen = numberController.numberLen;
        // 가로로 전화번호 표시
        // 적당한 간격으로 보여주기 위해 010-중간번호-끝번호로 SizedBox위젯을 이용
        // 문자열 슬라이싱을 이용해 실시간으로 키 입력이 반영되도록 함
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 010
            SizedBox(child: Text(number.substring(0, 3), style: numberStyle)),
            // 중간 번호
            SizedBox(child: Text(number.substring(3, min(7, numberController.numberLen)), style: numberStyle)),
            // 끝 번호
            SizedBox(child: Text(numberLen >= 7 ? numberController.number.substring(7) : '', style: numberStyle)),
          ],
        );
      }),
   );
}