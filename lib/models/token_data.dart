import 'package:get/get.dart';  

//////////////////
//  출석 데이터 //
/////////////////

// 데이터 클래스
class TokenData {
  final String stuId;
  final String name;
  final String token;

  TokenData({
    required this.stuId,
    required this.name,
    required this.token,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
      stuId: json['stuid'], 
      name: json['name'], 
      token: json['token'], 
    );
  }
}

// 데이터 컨트롤러
class TokenDataController extends GetxController {
  List<TokenData>? _tokenDataList;

  void setTokenDataList(List<TokenData> tokenDataList) {
    _tokenDataList = tokenDataList;
    update();
  }
  
  List<TokenData>? get tokenDataList => _tokenDataList;
  String get stuId => _tokenDataList![0].stuId;
  String get name => _tokenDataList![0].name;
  String get token => _tokenDataList![0].token;
}