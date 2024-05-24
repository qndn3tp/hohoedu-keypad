import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/attendance_button_controller.dart';
import 'package:hoho_keypad/style.dart';
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
    final screenSize = MediaQuery.of(Get.context!).size; 
    return Scaffold(
      backgroundColor: PrimaryColors.grey1,
      appBar: customAppbar(attendanceButtonController.getAttendanceStatus()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 텍스트
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: screenSize.height * 0.1,
              width: double.infinity,
              color: Colors.white, 
              child: explainText(),
            ),
            // 번호
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              height: screenSize.height * 0.3,
              child: numberText()
            ),
            // 키보드 입력
            Container(
              color: PrimaryColors.grey1,
              child: Obx(() => keyboard()),
            ),
          ],
        ),
      ),
      // 확인버튼
      bottomNavigationBar: confirmButton(),
    );
  }
}