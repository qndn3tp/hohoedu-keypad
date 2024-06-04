import 'package:flutter/material.dart';
import 'package:hoho_keypad/style.dart';

////////////////
//  키패드 키  //
////////////////
class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const KeyboardKey({super.key, 
    required this.label,
    required this.onTap,
    required this.value,
  });

  @override
  State<KeyboardKey> createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  final functionalKey = ["한자", "숫자", Icons.backspace_rounded];    // 숫자 입력이 아닌 기능 키

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: (){
          widget.onTap(widget.value);
        },
        child: AspectRatio(
          aspectRatio: 2,         // 키패드의 가로세로 비율
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: functionalKey.contains(widget.value) ? PrimaryColors.grey1 : Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(10), 
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFECECEC), 
                    offset: Offset(6.31, 6.31), 
                    blurRadius: 16, 
                  ),
                  BoxShadow(
                    color: Color(0xFFFFFFFF), 
                    offset: Offset(-6.31, -6.31), 
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Center(
                child: widget.label is String
                  ? Text( widget.label,
                    style: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                      color: PrimaryColors.textGrey),
                  )
                  : Icon(widget.label, color: PrimaryColors.textGrey),
              ),
            ),
        ),
      ),
    );
  }
}