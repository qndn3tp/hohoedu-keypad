import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/screens/home/attendance_button_controller.dart';
import 'package:hoho_keypad/services/get_token_data.dart';
import 'package:hoho_keypad/style.dart';
import 'package:hoho_keypad/utils/network_check.dart';
import 'package:hoho_keypad/widgets/custom_dialog.dart';
import 'package:hoho_keypad/screens/attendance/number_controller.dart';

////////////////
//  확인 버튼  //
////////////////
confirmButton() {
  final numberController = Get.put(NumberController());
  final connectivityController = Get.put(ConnectivityController());

  return InkWell(
    onTap: () async{
      // 번호가 모두 입력되면 실행할 로직
      if (numberController.numberLen == 9){
        if (connectivityController.isConnected.value) {
          // 번호에 해당하는 토큰 데이터 검색
          // 해당 토큰으로 알림 전송(서버)
          // db에 출석했음을 저장하는 로직
          await getTokenData();                    
        } else {
          failDialog("네트워크 연결을 확인해주세요");
        }
        numberController.number.value = '';             // 번호 초기화
      } 
      // 번호를 덜 누른 경우
      else {
        failDialog("9자리 모두 입력해주세요");
        numberController.number.value = '';             // 번호 초기화
      }
    },
    // 하단 확인 버튼
    child: const BottomAppBar(
      elevation: 0,
      color: PrimaryColors.grey1,
      child: ConfirmButton(),
    ),
  );
}


// 하단 확인 버튼
class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key});

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> with SingleTickerProviderStateMixin {
  final numberController = Get.put(NumberController());
  final AttendanceButtonController attendanceButtonController = Get.put(AttendanceButtonController());
  late AnimationController _animationController;      

  @override
  void initState() {
    super.initState();
    // 애니메이션 컨트롤러 생성
    _animationController = AnimationController(
      vsync: this,                
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,                             // 애니메이션 범위: 하한값
      upperBound: 0.1,                             // 애니메이션 범위: 상한가
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _animationController.value;          // 축소,확대 규모

    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _animationController.forward();                     // 애니메이션 시작: 현재값 -> 상한값
      },
      onPointerUp: (PointerUpEvent event) {
        _animationController.reverse();                     // 애니메이션 역방향: 현재값 -> 하한값
      },

      child: Transform.scale(
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
            color: attendanceButtonController.attendanceButton.value == 1
              ? PrimaryColors.orange 
              : PrimaryColors.blue,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 5.0,
                spreadRadius: 0.25,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "확인", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 25, 
                fontFamily: 'BMJUA'),
            ),
          ),
        ),
      ),
    );
  }
}