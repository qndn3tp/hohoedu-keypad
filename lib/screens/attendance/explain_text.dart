import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hohoedu_attendance/screens/attendance/number_controller.dart';
import 'package:hohoedu_attendance/style.dart';

///////////////////
//  설명 텍스트  //
//////////////////
explainText() {
  // 번호 컨트롤러
  final numberController = Get.put(NumberController());
  
  return Center(
    child: Obx(() {
      return Container(
        child: numberController.numberLen > 0                              // 번호의 입력이 시작되고
          ? numberController.numberLen == 9   
            ? const SizedBox()                                             // 모두 입력한 경우
            : const Text(                                                  // 덜 입력한 경우
              "9자리 모두 입력해주세요",                              
              style: TextStyle(fontSize: 18, color: Color(0xffd60f01)))   
          : const Text(                                                    // 아무 입력이 없는 경우  
            "번호를 입력해주세요", 
            style: TextStyle(fontSize: 18, color: PrimaryColors.textGrey))  
      );
    })
  );
}