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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 키패드의 키를 눌렀을 때
      onTap: (){
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,         // 키패드의 가로세로 비율
          child: Center(
            child: widget.label is String
              ? Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: PrimaryColors.textGrey),
              )
              : Icon(widget.label, color: PrimaryColors.textGrey),
          ),
      ),
    );
  }
}