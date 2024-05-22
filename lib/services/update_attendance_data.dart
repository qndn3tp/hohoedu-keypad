import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/models/token_data.dart';
import 'package:intl/intl.dart';
import 'package:hoho_keypad/screens/home/attendance_button_controller.dart';
import 'package:http/http.dart' as http;

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
  // try {
  //   // 응답을 성공적으로 받았을 때
  //   if (response.statusCode == 200) {
  //     final resultList = json.decode(response.body);

  //     // 응답 데이터가 성공일 때
  //     if (resultList[0]["result"] == null) {
  //     } else {
  //       // failDialog("");
  //     }
  //   }
  // }
  // // 응답을 받지 못했을 때
  // catch (e) {
  // }
}