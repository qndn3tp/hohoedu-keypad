import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/attendance_button_controller.dart';
import 'package:hoho_keypad/screens/attendance/attendance_screen.dart';

/////////////////
// 등/하원 버튼 //
/////////////////
Widget attendanceButton(title) {
  final attendanceButtonController = Get.put(AttendanceButtonController());
  final screenSize = MediaQuery.of(Get.context!).size;   

  return Container(
    margin: EdgeInsets.only(top: screenSize.height * 0.1),
    child: GestureDetector(
      onTap: () {
        Get.to(
          const AttendanceScreen(),
          transition: Transition.cupertino,
          duration: const Duration(milliseconds: 500),
        );
        // 등원
        if (title == "등원") {
          attendanceButtonController.setAttendanceButton(1);
        }
        // 하원 
        else {
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
              style: const TextStyle(color: Colors.white, fontSize: 45, fontFamily: 'BMJUA'),),
          ),
        ),
      )
    ),
  );
}