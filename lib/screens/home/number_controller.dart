import 'package:get/get.dart';  

////////////////////
//  번호 컨트롤러  //
////////////////////
class NumberController extends GetxController {
  RxString number = '010'.obs;

  // 번호 입력
  void onNumberPress(val) {
    if (number.value.length < 11) {
      number.value += val;
    }
  }
  // 번호 삭제
  onBackspacePress(val) {
    if (number.value.length > 3) {
      number.value = number.value.substring(0, number.value.length - 1);
    }
  }
  int get numberLen => number.value.length;
}