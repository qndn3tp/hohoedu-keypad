import 'package:flutter/material.dart';
import '../style.dart' as style;

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
      onTap: (){
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
          child: Center(
            child: widget.label is String
              ? Text(
                widget.label,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: style.TEXT_GREY),
              )
              : Icon(widget.label, color: style.TEXT_GREY),
          ),
      ),
    );
  }
}