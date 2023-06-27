import 'package:flutter_nb_net/flutter_net.dart';

/// success : true
/// msg : "成功"
/// response : {"deviceNum":31987,"deviceOriginalValue":49551.0,"newThisMonth":0,"scrapThisMonth":0,"dailyMaintain":0,"secondMaintain":0,"performanceTest":0,"meteringRemind":0,"insuranceRemind":0}

class Asset2 extends BaseNetModel {
  Asset2({
      bool? success, 
      String? msg, 
      Response? response,}){
    _success = success;
    _msg = msg;
    _response = response;
}

  Asset2.fromJson(dynamic json) {
    _success = json['success'];
    _msg = json['msg'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  bool? _success;
  String? _msg;
  Response? _response;
Asset2 copyWith({  bool? success,
  String? msg,
  Response? response,
}) => Asset2(  success: success ?? _success,
  msg: msg ?? _msg,
  response: response ?? _response,
);
  bool? get success => _success;
  String? get msg => _msg;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['msg'] = _msg;
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

  @override
  Asset2 fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return Asset2.fromJson(json);
  }

}

/// deviceNum : 31987
/// deviceOriginalValue : 49551.0
/// newThisMonth : 0
/// scrapThisMonth : 0
/// dailyMaintain : 0
/// secondMaintain : 0
/// performanceTest : 0
/// meteringRemind : 0
/// insuranceRemind : 0

class Response extends BaseNetModel{
  Response({
      num? deviceNum, 
      num? deviceOriginalValue, 
      num? newThisMonth, 
      num? scrapThisMonth, 
      num? dailyMaintain, 
      num? secondMaintain, 
      num? performanceTest, 
      num? meteringRemind, 
      num? insuranceRemind,}){
    _deviceNum = deviceNum;
    _deviceOriginalValue = deviceOriginalValue;
    _newThisMonth = newThisMonth;
    _scrapThisMonth = scrapThisMonth;
    _dailyMaintain = dailyMaintain;
    _secondMaintain = secondMaintain;
    _performanceTest = performanceTest;
    _meteringRemind = meteringRemind;
    _insuranceRemind = insuranceRemind;
}

  Response.fromJson(dynamic json) {
    _deviceNum = json['deviceNum'];
    _deviceOriginalValue = json['deviceOriginalValue'];
    _newThisMonth = json['newThisMonth'];
    _scrapThisMonth = json['scrapThisMonth'];
    _dailyMaintain = json['dailyMaintain'];
    _secondMaintain = json['secondMaintain'];
    _performanceTest = json['performanceTest'];
    _meteringRemind = json['meteringRemind'];
    _insuranceRemind = json['insuranceRemind'];
  }
  num? _deviceNum;
  num? _deviceOriginalValue;
  num? _newThisMonth;
  num? _scrapThisMonth;
  num? _dailyMaintain;
  num? _secondMaintain;
  num? _performanceTest;
  num? _meteringRemind;
  num? _insuranceRemind;
Response copyWith({  num? deviceNum,
  num? deviceOriginalValue,
  num? newThisMonth,
  num? scrapThisMonth,
  num? dailyMaintain,
  num? secondMaintain,
  num? performanceTest,
  num? meteringRemind,
  num? insuranceRemind,
}) => Response(  deviceNum: deviceNum ?? _deviceNum,
  deviceOriginalValue: deviceOriginalValue ?? _deviceOriginalValue,
  newThisMonth: newThisMonth ?? _newThisMonth,
  scrapThisMonth: scrapThisMonth ?? _scrapThisMonth,
  dailyMaintain: dailyMaintain ?? _dailyMaintain,
  secondMaintain: secondMaintain ?? _secondMaintain,
  performanceTest: performanceTest ?? _performanceTest,
  meteringRemind: meteringRemind ?? _meteringRemind,
  insuranceRemind: insuranceRemind ?? _insuranceRemind,
);
  num? get deviceNum => _deviceNum;
  num? get deviceOriginalValue => _deviceOriginalValue;
  num? get newThisMonth => _newThisMonth;
  num? get scrapThisMonth => _scrapThisMonth;
  num? get dailyMaintain => _dailyMaintain;
  num? get secondMaintain => _secondMaintain;
  num? get performanceTest => _performanceTest;
  num? get meteringRemind => _meteringRemind;
  num? get insuranceRemind => _insuranceRemind;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceNum'] = _deviceNum;
    map['deviceOriginalValue'] = _deviceOriginalValue;
    map['newThisMonth'] = _newThisMonth;
    map['scrapThisMonth'] = _scrapThisMonth;
    map['dailyMaintain'] = _dailyMaintain;
    map['secondMaintain'] = _secondMaintain;
    map['performanceTest'] = _performanceTest;
    map['meteringRemind'] = _meteringRemind;
    map['insuranceRemind'] = _insuranceRemind;
    return map;
  }

  @override
  Response fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return Response.fromJson(json);
  }

}