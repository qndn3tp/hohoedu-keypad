import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hohoedu_attendance/style.dart';

/////////////
//  알림창 //
/////////////
void customDialog(title, detail, imgPath) {
  showGeneralDialog(
    barrierLabel: '',
    barrierColor: Colors.black26,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      title: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: title =="전송 성공" 
                ? const Color(0xffc7f1c0) 
                : const Color(0xfff0cccc),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.contain
              ),
            ),
          ),
          Text(title, style: TextStyle(
            color: title =="전송 성공"
              ? const Color(0xff189f00)
              : const Color(0xffe92f2f),
            fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(detail, style: const TextStyle(color: PrimaryColors.textGrey, fontSize: 17),),
          ),
        ]
      ),
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
  Future.delayed(const Duration(milliseconds: 2500), () {
    Navigator.of(Get.context!).pop();
  });
}

successDiaog(detail) {
  return customDialog("전송 성공", detail, "assets/images/success.png");
}

failDialog(detail) {
  return customDialog("전송 실패", detail, "assets/images/fail.png");
}