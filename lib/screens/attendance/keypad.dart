import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/widgets/keyboard_key.dart';
import 'package:hoho_keypad/screens/attendance/number_controller.dart';  

///////////////
//  키패드  //
///////////////

class KeyController extends GetxController {
  RxBool isDigit = true.obs;            // 숫자 키보드:true, 한자 키보드: false

  void changeKey() {
    isDigit.value = !isDigit.value;
  }
}

Widget keyboard() {
  // 번호 컨트롤러
  final numberController = Get.put(NumberController());
  final keyController = Get.put(KeyController());
  
  // 숫자 키보드
  final digitKeys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['한자', '0', Icons.backspace_rounded]
  ];

  // 한자 키보드
  final hanjaKeys = [
    ['一', '二', '三'],
    ['四', '五', '六'],
    ['七', '八', '九'],
    ['숫자', '〇', Icons.backspace_rounded]
  ];

  final keys = keyController.isDigit.value ? digitKeys : hanjaKeys;

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
              ? numberController.onNumberPress      // 번호 입력 로직
              : numberController.onBackspacePress,  // 뒤로가기 아이콘 로직
            value: y,
          ),
        );
      }).toList(),
    ),  
  )
  .toList(),
  );
}