import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hohoedu_attendance/models/token_data.dart';
import 'package:hohoedu_attendance/screens/home/home_screen.dart';
import 'package:hohoedu_attendance/services/send_attendance_noti.dart';
import 'package:hohoedu_attendance/services/send_dummy_noti.dart';
import 'package:hohoedu_attendance/widgets/custom_dialog.dart';
import 'package:intl/intl.dart';
import 'package:hohoedu_attendance/screens/home/attendance_button_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


/////////////////////////
// 출결 정보 db에 저장 //
/// ////////////////////
Future<void> updateAttendanceData() async {
  final attendanceButtonController = Get.put(AttendanceButtonController());
  final tokenDataController = Get.put(TokenDataController());

  var url = Uri.parse(dotenv.get("TIMECHECK_UPDATE_URL"));

  // 출결 정보
  final stuId = tokenDataController.stuId;
  final gubun = attendanceButtonController.attendanceButton.value.toString();
  DateTime now = DateTime.now().toUtc().add(const Duration(hours: 9));
  String ymd = DateFormat('yyyy-MM-dd').format(now);
  String hhmm = DateFormat('HHmm').format(now);

  // HTTP POST 요청
  var response = await http.post(
    url,
    body: {
      'stuid': stuId,
      'ymd': ymd,
      'hhmm': hhmm,
      'gubun': gubun,
    }
  );

  // 응답의 content-type utf-8로 인코딩으로 설정
  if (response.headers['content-type']
  ?.toLowerCase().contains('charset=utf-8') != true) {
    response.headers['content-type'] = 'application/json; charset=utf-8';
  }

  try {
    // 응답을 성공적으로 받았을 때
    if (response.statusCode == 200) {
      final resultList = json.decode(response.body);
      print(resultList[0]['result']);

      final result = resultList[0]['result'];
      // 정상
      if (result =="0000") {
        successDiaog("알림을 전송했어요!");
        
        // 해당 토큰데이터로 실제 출결 알림 전송
        await sendDummyNoti();              // 더미 알림을 보내 기기를 깨운 뒤,
        await sendAttendanceNoti();         // 실제 알림 전송
      } 
      // 등원 없이 하원 등록
      else if (result == "8888") {
        failDialog("등원을 먼저 해주세요");
      } 
      // 등원을 두번 하는 경우
      else if (result == "7777") {
        failDialog("이미 등원처리 되었어요.");
      } 
      // 하원을 두번 하는 경우
      else if (result == "6666") {
        failDialog("이미 하원처리 되었어요.");
      }
      // 오류(내용 없음)
      else {
        failDialog("다시 시도해주세요.");
      }
      await Future.delayed(const Duration(milliseconds: 2000));
      Get.off(Home());
    }
  }
  catch (e) {
  }
}