import 'package:get/get.dart';
import 'package:hoho_keypad/screens/attendance/keypad.dart';  

////////////////////
//  번호 컨트롤러  //
////////////////////

class NumberController extends GetxController {
  final keyController = Get.put(KeyController());
  // 번호
  RxString number = ''.obs;

  Map<String, String> hanjaToDigit = {
    '〇': '0', '一': '1', '二': '2',
    '三': '3', '四': '4', '五': '5',
    '六': '6', '七': '7', '八': '8',
    '九': '9',
  };

  // 번호 입력
  void onNumberPress(val) {       
    // "숫자", "한자" 키 클릭 => 키보드 변경        
    if (val == "숫자" || val == "한자") {     
      keyController.changeKey();
    } 
    else { 
      if (number.value.length < 9) {        // 9자리까지만 입력, 하나씩 추가
        // 숫자 키보드
        if (keyController.isDigit.value) {
          number.value += val;
        } 
        // 한자 키보드
        else {
          final key = val.toString();
          number.value += hanjaToDigit[key]!;
        }
      }
    }
  }

  // 번호 삭제
  void onBackspacePress(val) {
    if (number.value.isNotEmpty) {        // 뒤에서부터 하나씩 삭제
      number.value = number.value.substring(0, number.value.length - 1);
    }
  }

  // 번호 길이
  int get numberLen => number.value.length;
}