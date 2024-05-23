import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/models/token_data.dart';
import 'package:http/http.dart' as http;

/////////////////////
/// 더미 알림 전송 //
////////////////////

/// iOS의 경우 앱이 완전히 종료되었을 때
/// 첫번째 알림은 앱을 깨우고, 두번째 알림부터 수신하게 됨
/// 이를 방지하기 위해 더미 알림을 먼저 보내고 실제 알림을 보내
/// 알림을 무조건 수신할 수 있도록 강제함.
Future<void> sendDummyNoti() async {
  final tokenDataController = Get.put(TokenDataController());

  var url = Uri.parse(dotenv.get("TOKEN_SEND_SERVER_URL"));

  // 토큰데이터 정보
  final token = tokenDataController.token;

  // HTTP POST 요청
  await http.post(
    url, 
    body: {
      'token': token,
      'title': " ",
      'body': " ",
      'noticeNum': "-1",
    }
  );
}