import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hohoedu_attendance/models/token_data.dart';
import 'package:hohoedu_attendance/screens/home/attendance_button_controller.dart';
import 'package:hohoedu_attendance/widgets/custom_dialog.dart';
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
      // 토큰 유효성 검사
      if (result["invalid_tokens"] == "") {
      } else {
        failDialog("유효하지 않은 토큰이에요");
      }
    } else {
      failDialog("fcm 서버와 통신 실패했어요");
    }
  } else {
    failDialog("서버 응답이 없어요");
  }
}