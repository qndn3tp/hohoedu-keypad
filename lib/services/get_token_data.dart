import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/models/token_data.dart';
import 'package:hoho_keypad/screens/attendance/number_controller.dart';
import 'package:hoho_keypad/services/send_attendance_noti.dart';
import 'package:hoho_keypad/widgets/custom_dialog.dart';
import 'package:http/http.dart' as http;

////////////////////////////////
/// 번호에 해당하는 토큰 데이터 //
/// ////////////////////////////
Future<void> getTokenData() async {
  final NumberController numberController = Get.put(NumberController());

  var url = Uri.parse(dotenv.get("GET_TOKEN_DATA_URL"));

  final attendanceNumber = numberController.number.value;

  // HTTP POST 요청
  var response = await http.post(
    url,
    body: {
      'appid': attendanceNumber,
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

      if (resultList[0]["result"] == null) {
        final resultList0 = resultList.cast<Map<String, dynamic>>();
        // JSON 데이터를 TokenData 객체 리스트로 파싱
        List<TokenData> tokenDataList = resultList0.map<TokenData>((json) => TokenData.fromJson(json)).toList();
        final TokenDataController tokenDataController = Get.put(TokenDataController());
        tokenDataController.setTokenDataList(tokenDataList);

        // 해당 토큰데이터로 출결 알림 전송
        await sendAttendanceNoti();
      }
      else {
        failDialog("토큰 데이터가 없습니다");
      }
    }
  }
  // 응답을 받지 못했을 때
  catch (e) {
    failDialog("존재하지 않는 번호에요");
  }
}