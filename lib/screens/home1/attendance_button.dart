import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home1/attendance_button_controller.dart';
import 'package:hoho_keypad/screens/home2/home2.dart';

/////////////////
// 등/하원 버튼 //
/////////////////
Widget attendanceButton(title, screenSize) {
  final attendanceButtonController = Get.put(AttendanceButtonController());

  return GestureDetector(
    onTap: () {
      Get.to(const Home2());
      if (title == "등원") {
        attendanceButtonController.setAttendanceButton(1);
      } else {
        attendanceButtonController.setAttendanceButton(2);
      }
    }, 
    child: Center(
      child: Container(
        height: screenSize.height * 0.2,
        width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: title == "등원" 
            ? const Color(0xfffd7024)
            : const Color(0xff4b54ff),
        ),
        child: Center(
           child: Text(
            title, 
            style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        ),
      ),
    )
  );
}