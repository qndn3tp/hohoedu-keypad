import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hohoedu_attendance/screens/home/attendance_button_controller.dart';
import 'package:hohoedu_attendance/style.dart';
import 'package:hohoedu_attendance/widgets/confirm_button.dart';
import 'package:hohoedu_attendance/screens/attendance/explain_text.dart';
import 'package:hohoedu_attendance/screens/attendance/keypad.dart';
import 'package:hohoedu_attendance/screens/attendance/number_text.dart';
import 'package:hohoedu_attendance/widgets/custom_appbar.dart';

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
    final screenHeight = MediaQuery.of(Get.context!).size.height - 200; 

    return Scaffold(
      backgroundColor: PrimaryColors.grey1,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), 
        child: customAppbar(attendanceButtonController.getAttendanceStatus())
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 텍스트
            Container(
              padding: const EdgeInsets.only(top: 50),
              color: Colors.white, 
              child: explainText(),
            ),
            // 번호
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              height: screenHeight * 0.45,
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