import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hoho_keypad/style.dart';

/////////////////////
// 출석 완료 알림창 //
/////////////////////
void customDialog(BuildContext context, text, {icon}) {
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
    context: context,
  );

  // 1초 후에 알림창 닫기
  Future.delayed(const Duration(milliseconds: 1500), () {
    Navigator.of(context).pop();
  });
}