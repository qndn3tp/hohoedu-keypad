import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/management/student_list_screen.dart';
import 'package:hoho_keypad/widgets/custom_appbar.dart';
import '../../style.dart';

/////////////////
// 로그인 화면 //
/////////////////

// 로그인 컨트롤러
class LoginController extends GetxController {
  TextEditingController idController = TextEditingController();
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("관리자 페이지"),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 아이디
            const Padding(
              padding: EdgeInsets.only(left: 5, bottom: 5),
              child: Text("센터 아이디", style: TextStyle(color: PrimaryColors.textGrey, fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: TextField(
                controller: loginController.idController,
                cursorColor: PrimaryColors.grey3,
                decoration: loginBoxDecoration("아이디"),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20,),
            loginButton()
          ],
        ),
      ),
    );
  }
}

InputDecoration loginBoxDecoration(text, {passwordVisibleController}) {
  return const InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: PrimaryColors.grey1,),
      borderRadius: BorderRadius.all(Radius.circular(20))),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: PrimaryColors.grey2, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(20))),
    contentPadding: EdgeInsets.only(left: 20),
  );
}


Widget loginButton() {
  return GestureDetector(
    onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();      // 키보드 입력 해제
      Get.to(
        const StudentListScreen(),
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 500),
      );
    }, 
    child: Center(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: PrimaryColors.grey2,
              width: 2
            )
        ),
        child: const Center(
           child: Text(
            "로그인", 
            style: TextStyle(color: PrimaryColors.textGrey, fontSize: 16, fontWeight: FontWeight.bold),),
        ),
      ),
    )
  );
}