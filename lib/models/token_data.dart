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
  TokenData? _tokenData;

  void setTokenData(TokenData tokenData) {
    _tokenData = tokenData;
    update();
  }
  
  TokenData? get tokenData => _tokenData;
  String get stuId => _tokenData!.stuId;
  String get name => _tokenData!.name;
  String get token => _tokenData!.token;
}