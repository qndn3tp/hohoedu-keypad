import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/number_controller.dart';
import '../../style.dart' as style;

///////////////////
//  설명 텍스트  //
//////////////////
explainText(screenSize) {
  final numberController = Get.put(NumberController());

  return Container(
    margin: const EdgeInsets.only(top: 20),
    height: screenSize.height * 0.05,
    width: screenSize.width * 0.55,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            '전화번호를 입력해주세요',
            style: TextStyle(fontSize: 16, color: style.TEXT_GREY),
          ),
          Obx(() {
            return Container(
              child: numberController.numberLen > 3
                ? numberController.numberLen == 11
                    ? Icon(EvaIcons.checkmarkCircle2, color: Colors.green[400])
                    : Icon(EvaIcons.closeCircle, color: Colors.red[400])
                : null
            );
          }),
        ],
      ),
    ),
  );
}