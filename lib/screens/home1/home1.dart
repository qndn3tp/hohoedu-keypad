import 'package:flutter/material.dart';
import 'package:hoho_keypad/screens/home1/attendance_button.dart';
import 'package:hoho_keypad/widgets/logo.dart';

//////////////////////////////
// 홈 화면(등하원 버튼 선택) //
//////////////////////////////
class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;       // 현재 기기의 화면 크기
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          children: [
            logoImage(screenSize),
            SizedBox(height: screenSize.height  * 0.1),
            attendanceButton("등원", screenSize),
            SizedBox(height: screenSize.height  * 0.1),
            attendanceButton("하원", screenSize)
          ],
        ),
      ),
    );
  }
}