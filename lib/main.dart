import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hoho_keypad/screens/home/home.dart';

void main() async{
  // 앱의 바인딩 초기화(flutter engine과의 상호작용을 위한 준비)
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized(); 
  // 화면 세로방향 고정                                        
  await SystemChrome.setPreferredOrientations([                               
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}