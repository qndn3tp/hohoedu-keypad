import 'package:flutter/material.dart';
import 'package:hohoedu_attendance/screens/home/attendance_button.dart';
import 'package:hohoedu_attendance/widgets/logo.dart';

//////////////////////////////
// 홈 화면(등하원 버튼 선택) //
//////////////////////////////
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            logoImage(),
            attendanceButton("등원"),
            attendanceButton("하원")
          ],
        ),
      ),
    );
  }
}