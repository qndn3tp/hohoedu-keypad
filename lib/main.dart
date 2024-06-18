import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hohoedu_attendance/screens/home/home_screen.dart';

void main() async{
  // 앱의 바인딩 초기화(flutter engine과의 상호작용을 위한 준비)
  WidgetsFlutterBinding.ensureInitialized(); 
  // 환경변수 파일 로드
  await dotenv.load(fileName: ".env");
  // 화면 세로방향 고정                                        
  await SystemChrome.setPreferredOrientations([                               
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const GetMaterialApp(
      home: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}