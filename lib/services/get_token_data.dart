import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hohoedu_attendance/models/token_data.dart';
import 'package:hohoedu_attendance/screens/attendance/number_controller.dart';
import 'package:hohoedu_attendance/services/update_attendance_data.dart';
import 'package:hohoedu_attendance/widgets/custom_dialog.dart';
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
        TokenData tokenData = TokenData.fromJson(resultList[0]); 
        final TokenDataController tokenDataController = Get.put(TokenDataController());
        tokenDataController.setTokenData(tokenData);

        // 출결 정보 확인
        await updateAttendanceData();
      }
      else {
        failDialog("저장된 데이터가 없어요");
      }
    } else {
      failDialog("서버와 통신 실패했어요");
    }
  }
  // 응답을 받지 못했을 때
  catch (e) {
    failDialog("존재하지 않는 번호에요");
  }
}