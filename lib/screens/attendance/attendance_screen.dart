import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/attendance_button_controller.dart';
import 'package:hoho_keypad/widgets/confirm_button.dart';
import 'package:hoho_keypad/screens/attendance/explain_text.dart';
import 'package:hoho_keypad/screens/attendance/keypad.dart';
import 'package:hoho_keypad/screens/attendance/number_text.dart';
import 'package:hoho_keypad/widgets/custom_appbar.dart';

///////////////////////
// 홈 화면(번호 입력) //
///////////////////////
class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final attendanceButtonController = Get.put(AttendanceButtonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(attendanceButtonController.getAttendanceStatus()),
      body: Center(
        child: Column(
          children: [
            // 텍스트
            explainText(),
            // 번호
            numberText(),
            // 키보드 입력
            keyboard(),
          ],
        ),
      ),
      // 확인버튼
      bottomNavigationBar: confirmButton(),
    );
  }
}