import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/widgets/keyboard_key.dart';
import 'package:hoho_keypad/screens/home/number_controller.dart';  

///////////////
//  키패드  //
///////////////
keyboard() {
  final numberController = Get.put(NumberController());

  final keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['', '0', Icons.backspace_outlined]
  ];

  return Column(children: keys
  .map(
    (x) => Row(
      children: x.map((y) {
        return Expanded(
          child: KeyboardKey(
            label: y,
            onTap: y is String ? numberController.onNumberPress : numberController.onBackspacePress,
            value: y,
          ),
        );
      }).toList(),
    ),  
  )
  .toList(),
  );
}