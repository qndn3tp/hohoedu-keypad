import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/style.dart';

/////////////
//  알림창 //
/////////////
void customDialog(text, {emoji}) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Center(child: Text(emoji),),],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center( 
            child: 
              Text(
                text, 
                style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: PrimaryColors.textGrey))
          ),
          const Text("")
        ],
      )
    ),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    context: Get.context!,
  );
  // 1초 후에 알림창 닫기
  Future.delayed(const Duration(milliseconds: 2000), () {
    Navigator.of(Get.context!).pop();
  });
}

successDiaog(text) {
  return customDialog(text, emoji: "\u{2705}");
}

failDialog(text) {
  return customDialog(text, emoji: "\u{26A0}");
}