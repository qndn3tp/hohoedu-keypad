import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home1/attendance_button_controller.dart';
import 'package:hoho_keypad/widgets/confirm_button.dart';
import 'package:hoho_keypad/screens/home2/explain_text.dart';
import 'package:hoho_keypad/screens/home2/keypad.dart';
import 'package:hoho_keypad/screens/home2/number_text.dart';

///////////////////////
// 홈 화면(번호 입력) //
///////////////////////
class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final attendanceButtonController = Get.put(AttendanceButtonController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;       // 현재 기기의 화면 크기

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        title: Text(attendanceButtonController.getAttendanceStatus(), style: const TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            color: Color(0xffe4e1e1),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // 텍스트
            explainText(screenSize),
            // 번호
            numberText(screenSize),
            // 키보드 입력
            keyboard(),
          ],
        ),
      ),
      // 확인버튼
      bottomNavigationBar: confirmButton(context),
    );
  }
}