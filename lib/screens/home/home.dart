import 'package:flutter/material.dart';
import 'package:hoho_keypad/widgets/confirm_button.dart';
import 'package:hoho_keypad/screens/home/explain_text.dart';
import 'package:hoho_keypad/screens/home/keypad.dart';
import 'package:hoho_keypad/widgets/logo.dart';  
import 'package:hoho_keypad/screens/home/number_text.dart';

///////////////
//  홈 화면  //
///////////////
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;       // 현재 기기의 화면 크기

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          children: [
            // 로고
            logoImage(screenSize),
            // 텍스트
            explainText(screenSize),
            // 번호
            numberText(screenSize),
            // 키보드 입력
            Expanded(
              child: keyboard(),
            ),
          ],
        ),
      ),
      // 확인버튼
      bottomNavigationBar: confirmButton(context),
    );
  }
}