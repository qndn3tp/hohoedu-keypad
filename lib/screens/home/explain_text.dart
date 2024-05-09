import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/number_controller.dart';
import '../../style.dart' as style;

///////////////////
//  설명 텍스트  //
//////////////////
explainText(screenSize) {
  // 전화번호 컨트롤러
  final numberController = Get.put(NumberController());

  return Container(
    margin: const EdgeInsets.only(top: 20),
    height: screenSize.height * 0.05,
    width: screenSize.width * 0.55,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 설명 텍스트
          const Text(
            '전화번호를 입력해주세요',
            style: TextStyle(
              fontSize: 16, 
              color: style.TEXT_GREY),
          ),
          // 전화번호가 올바르게 입력되었는지 아이콘 표시
          Obx(() {
            return Container(
              child: numberController.numberLen > 3                                 // 전화번호의 입력이 시작되고
                ? numberController.numberLen == 11                  
                    ? Icon(EvaIcons.checkmarkCircle2, color: Colors.green[400])   // 모두 입력한 경우
                    : Icon(EvaIcons.closeCircle, color: Colors.red[400])          // 덜 입력한 경우
                : null                                                              // 아무 입력이 없는 경우
            );
          }),
        ],
      ),
    ),
  );
}