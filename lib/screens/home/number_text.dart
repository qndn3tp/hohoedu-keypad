import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/number_controller.dart';
import '../../style.dart' as style;

/////////////////
// 번호 텍스트 //
////////////////
numberText(screenSize) {
  final numberController = Get.put(NumberController());
  const numberStyle = TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: style.TEXT_GREY);
  
  return SizedBox(
    height: screenSize.height * 0.2,
    width: screenSize.width * 0.7,
    child: Obx(
      () {
        final number = numberController.number;
        final numberLen = numberController.numberLen;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(child: Text(number.substring(0, 3), style: numberStyle)),
            SizedBox(child: Text(number.substring(3, min(7, numberController.numberLen)), style: numberStyle)),
            SizedBox(child: Text(numberLen >= 7 ? numberController.number.substring(7) : '', style: numberStyle)),
          ],
        );
      }),
   );
}