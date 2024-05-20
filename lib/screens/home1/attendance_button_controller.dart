import 'package:get/get.dart';

//////////////////////////
// 등/하원 버튼 컨트롤러 //
//////////////////////////
class AttendanceButtonController extends GetxController{
  RxInt attendanceButton = 1.obs;       // 등원: 1, 하원 2
  RxString attendanceStatus = ''.obs;
  

  void setAttendanceButton(value){
    attendanceButton.value = value;
  }

  void updateAttendanceStatus() {
    if (attendanceButton.value == 1) {
      attendanceStatus.value = "등원";
    } else {
      attendanceStatus.value = "하원";
    }
  }

  String getAttendanceStatus() {
    updateAttendanceStatus();
    return attendanceStatus.value;
  }
}