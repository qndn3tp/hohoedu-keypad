import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/attendance_button.dart';
import 'package:hoho_keypad/screens/student_management/login.dart';
import 'package:hoho_keypad/style.dart';
import 'package:hoho_keypad/widgets/logo.dart';

//////////////////////////////
// 홈 화면(등하원 버튼 선택) //
//////////////////////////////
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;   
       
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: IconButton(
          onPressed: (){
            Get.to(
              LoginScreen(),
              transition: Transition.cupertino,
              duration: const Duration(milliseconds: 500),
            );
          }, 
          icon: const Icon(Icons.person_rounded, color: PrimaryColors.grey3,)),
      ),
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