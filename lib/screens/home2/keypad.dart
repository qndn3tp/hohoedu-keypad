import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/widgets/keyboard_key.dart';
import 'package:hoho_keypad/screens/home2/number_controller.dart';  

///////////////
//  키패드  //
///////////////
keyboard() {
  // 전화번호 컨트롤러
  final numberController = Get.put(NumberController());
  
  // 키패드 배열
  final keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['', '0', Icons.backspace_outlined]
  ];

  return Column(children: keys
  .map(
    // x: 키패드의 행
    (x) => Row(                 
      children: x.map((y) {   
        // y: 각 행에 해당하는 원소(키패드의 키)  
        return Expanded(
          child: KeyboardKey(
            label: y,
            onTap: y is String  
              ? numberController.onNumberPress      // 번호를 입력했을 경우 로직
              : numberController.onBackspacePress,  // 뒤로가기 아이콘을 입력했을 경우 로직
            value: y,
          ),
        );
      }).toList(),
    ),  
  )
  .toList(),
  );
}