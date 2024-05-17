import 'package:http/http.dart' as http;

void sendAttendanceNoti() async {
  var url = Uri.parse('http://hohoedufcm.gabia.io/');

  const token = "c7KQVugNTTy4tIGW0y03_W:APA91bEwuO4-gXrmdoz6bMCvpswEeVo6fnsl-3zGSjRaGD9lPK6KQwShrB4OSWznDQ_i4Fm3XFbCDT0ihRp3XLVPgzGMT4rszL16vvtdXvOS-LKVQCjFOk39N4UpuneoGyttve40epyx";
  const body = "김호호 학생이 출석했습니다";

  // 보낼 데이터
  var data = {
    'token': token,
    'title': "출석 알림",
    'body': body,
    'noticeNum': "2"
  };

  // HTTP POST 요청 보내기
  var response = await http.post(url, body: data);

  // 응답 확인
  if (response.statusCode == 200) {
    print('요청 성공: ${response.body}');
  } else {
    print('요청 실패: ${response.statusCode}');
  }
}