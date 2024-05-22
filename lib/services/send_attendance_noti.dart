import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/models/token_data.dart';
import 'package:hoho_keypad/screens/home/attendance_button_controller.dart';
import 'package:hoho_keypad/services/store_attendance_data.dart';
import 'package:hoho_keypad/widgets/custom_dialog.dart';
import 'package:http/http.dart' as http;

////////////////////
/// 출결알림 전송 //
/// ///////////////
Future<void> sendAttendanceNoti() async {
  final attendanceButtonController = Get.put(AttendanceButtonController());
  final attendanceStatus = attendanceButtonController.getAttendanceStatus();
  final tokenDataController = Get.put(TokenDataController());

  var url = Uri.parse(dotenv.get("TOKEN_SEND_SERVER_URL"));

  // 토큰데이터 정보
  final token = tokenDataController.token;
  final name = tokenDataController.name;
  final body = "$name학생이 $attendanceStatus했습니다.";

  // HTTP POST 요청
  var response = await http.post(
    url, 
    body: {
      'token': token,
      'title': "출석 알림",
      'body': body,
      'noticeNum': "2"
    }
  );

  // 응답 확인
  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    // fcm 서버와 통신
    if (result["status"] == "success") {
      // 토큰 유효성
      if (result["invalid_tokens"] == "") {
        // 최종적으로 알림이 전송되면 출결 정보 업데이트
        successDiaog("전송 완료");
        await storeAttendanceData();
      } else {
        failDialog("유효하지 않은 토큰");
      }
    } else {
      failDialog("fcm 통신 실패");
    }
  } else {
    failDialog("전송 실패");
  }
}