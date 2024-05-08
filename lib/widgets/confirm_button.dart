import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/widgets/custom_dialog.dart';
import 'package:hoho_keypad/screens/home/number_controller.dart';
import '../style.dart' as style;

////////////////
//  확인 버튼  //
////////////////
confirmButton(context) {
  final numberController = Get.put(NumberController());

  return InkWell(
    onTap: (){
      if (numberController.numberLen == 11){
        print("확인");
        customDialog(
          context, "출석완료", 
          icon: Icon(
            EvaIcons.checkmarkCircle2, 
            color: Colors.green[400])
        );
        numberController.number.value = '010';
      } else {
        null;
      }
    },
    child: const BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: ConfirmButton(),
    ),
  );
}


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
            color: style.PRIMARY_BLUE,
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
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}