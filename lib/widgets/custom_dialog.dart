import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/style.dart';

/////////////////////
// 출석 완료 알림창 //
/////////////////////
void customDialog(text, {icon}) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      title: Center(
        child: Text(
          text, 
          style: const TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold, 
            color: PrimaryColors.textGrey),)
      ),
      content: icon,
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
  Future.delayed(const Duration(milliseconds: 1500), () {
    Navigator.of(Get.context!).pop();
  });
}

successDiaog(text) {
  return customDialog(                        
    text, 
    icon: Icon(EvaIcons.checkmarkCircle2, color: Colors.green[400])
  );
}

failDialog(text) {
  return customDialog(                        
    text, 
    icon: Icon(EvaIcons.closeCircle, color: Colors.red[400])
  );
}