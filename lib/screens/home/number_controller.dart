import 'package:get/get.dart';  

////////////////////
//  번호 컨트롤러  //
////////////////////

// 전화번호 변수를 실시간으로 관리하기 위해 
// setState()대신 상태관리패키지인 getx 사용.
class NumberController extends GetxController {
  // 번호
  RxString number = '010'.obs;

  // 번호 입력
  void onNumberPress(val) {               // 11자리까지만 입력, 하나씩 추가
    if (number.value.length < 11) {
      number.value += val;
    }
  }

  // 번호 삭제
  void onBackspacePress(val) {
    if (number.value.length > 3) {        // 010은 남겨두고 뒤에서부터 하나씩 삭제
      number.value = number.value.substring(0, number.value.length - 1);
    }
  }

  // 번호 길이
  int get numberLen => number.value.length;
}