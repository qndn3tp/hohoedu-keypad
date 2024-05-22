import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_keypad/style.dart';
import 'package:hoho_keypad/widgets/custom_appbar.dart';

////////////////////////
// 학생 출결 관리 화면 //
////////////////////////
class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("학생 리스트"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 텍스트
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            width: screenSize.width * 0.33,
            child: const Text("대구 월성 본원", style: TextStyle(color: PrimaryColors.textGrey, fontWeight: FontWeight.bold, fontSize: 17),),
          ),
          // 날짜
          Container(
            margin: EdgeInsets.symmetric(horizontal:  screenSize.width * 0.33, vertical: 20),
            child: const Center(child: Text("5월 20일", style: TextStyle(color: PrimaryColors.textGrey, fontWeight: FontWeight.bold, fontSize: 18),)),
          ),
          // 상단 학생/출결
          tableTitle(),
          // 테이블 내용
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
              return tableContent();
              }
            )
          )
        ],
      ),
    );
  }
}

// 상단 학생/출결
Widget tableTitle() {
  const TextStyle textStyle = TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold);
  final Size screenSize = MediaQuery.of(Get.context!).size;
  const int columnFlex = 3; 

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    color: PrimaryColors.indigo,
    height: screenSize.height * 0.05,
    child: Row(
      children: [
        // 학생
        const Expanded(
          flex: columnFlex,
          child: Center(
            child: Text("학생", style: textStyle,)),
        ),
        // 수직 구분선
        Container(width: 1, color: Colors.grey),
        // 출결
         const Expanded(
          flex: 10 - columnFlex*2,
          child: Center(
            child: Text("출결", style: textStyle,)
          ),
        ),
        Container(width: 1, color: Colors.grey),
        const Expanded(
          flex: columnFlex,
          child: Center(
            child: Text("알림", style: textStyle,)
          ),
        ),
      ],
    )
  );
}

// 테이블 내용
Widget tableContent() {
  final Size screenSize = MediaQuery.of(Get.context!).size;
  const int columnFlex = 3; 

  return Container(
    color: const Color.fromARGB(255, 250, 250, 250) ,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: screenSize.height * 0.08,
    child: Row(
      children: [
        // 날짜
        const Expanded(
          flex: columnFlex,
          child: Center(
            child: Text('김호호'),
          ),
        ),
        Container(width: 1, color: Colors.grey),
        // 출결 세부 내용
        const Expanded(
          flex: (10 - columnFlex*2),
          child: Center(child: Text("출석"))
        ),
        Container(width: 1, color: Colors.grey),
        // 결석알림버튼(결석일때만)
        Expanded(
          flex: columnFlex,
          child: Center(
            child: TextButton(
              onPressed: (){}, 
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 243, 81, 81)            ),
                child: const Text("결석 알림", style: TextStyle(color: Colors.white, fontSize: 13),),
              )
            )
          )
        )
      ],
    )
  );
}