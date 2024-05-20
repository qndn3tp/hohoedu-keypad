import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/services/send_attendance_noti.dart';
import 'package:hoho_keypad/style.dart';
import 'package:hoho_keypad/utils/network_check.dart';
import 'package:hoho_keypad/widgets/custom_dialog.dart';
import 'package:hoho_keypad/screens/attendance/number_controller.dart';

////////////////
//  확인 버튼  //
////////////////
confirmButton() {
  final numberController = Get.put(NumberController());

  return InkWell(
    // 버튼을 눌렀을 때
    onTap: () async{
      // 전화번호가 모두 입력되면 실행할 로직
      if (numberController.numberLen == 11){

        // 네트워크가 연결 확인
        var connectivityResult = await connectivityCheck();
        if (connectivityResult) {
          // getNumberToken();                     // 해당 번호에 해당하는 토큰을 찾는 로직
          // getNumberName();                      //           ..        학생 이름을 찾는 로직
          sendAttendanceNoti();                    // 해당 토큰으로 알림을 보내는 로직
          // setAttendanceData();                  // db에 출석했음을 저장하는 로직(출석체크 페이지를 위함)
        } else {
          failDialog("네트워크 연결을 확인해주세요");
        }
        numberController.number.value = '010';             // 번호 초기화
      } 
      // 전화번호가 잘못 입력된 경우
      else {
        failDialog("번호를 다시 입력해주세요");
        numberController.number.value = '010';             // 번호 초기화
      }
    },
    // 하단 확인 버튼
    child: const BottomAppBar(
      elevation: 0,
      color: Colors.white,
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
            color: PrimaryColors.indigo,
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
                fontSize: 20, 
                fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}