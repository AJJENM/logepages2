import 'package:flutter_nb_net/flutter_net.dart';

/// success : true
/// msg : "成功"
/// response : [{"deptId":"03594f9f-d1ba-4198-9039-b795505dc2be","deptCode":"001001","deptName":"系统运维","director":null,"assetQuantity":0},{"deptId":"aa1b87b1-c7d7-4a91-a442-aabb391a2ce9","deptCode":"001002","deptName":"贵阳市第三人民医院","director":null,"assetQuantity":0},{"deptId":"f1fce284-4881-4bcf-bd85-b778981eecb3","deptCode":"001003","deptName":"皖南医学院","director":null,"assetQuantity":0},{"deptId":"c1e85c56-c29b-47b2-9b6b-ae191ec661ba","deptCode":"001004","deptName":"南陵县医院","director":null,"assetQuantity":0},{"deptId":"4533d813-f57d-410b-9fe5-ac15cf08f44a","deptCode":"001005","deptName":"石棉县人民医院","director":null,"assetQuantity":0},{"deptId":"ad1be89c-bb37-46a7-94ee-8cb888f55d16","deptCode":"001006","deptName":"重庆市渝北区人民医院","director":null,"assetQuantity":0},{"deptId":"3d774f45-bd7e-4b3e-98e6-db0de3ecc511","deptCode":"001007","deptName":"成都大学附属医院","director":null,"assetQuantity":0},{"deptId":"eb80c5b5-1d6e-4f4f-a9fd-b32bdfa47d10","deptCode":"001008","deptName":"测试医院","director":null,"assetQuantity":0},{"deptId":"cf23267e-9d24-4c85-a3d8-cedbd790ca93","deptCode":"001009","deptName":"修文百信医院","director":null,"assetQuantity":0},{"deptId":"95be673b-246a-474c-9722-bb160ca2233d","deptCode":"001010","deptName":"固镇县中医院","director":null,"assetQuantity":0},{"deptId":"e1df7b06-dd1d-426e-ad89-c9c244b0c694","deptCode":"001011","deptName":"平坝区中医院","director":null,"assetQuantity":0},{"deptId":"edfa9284-d353-4107-9ffd-203d9a4d153e","deptCode":"001012","deptName":"武汉市精神卫生中心","director":null,"assetQuantity":0},{"deptId":"cbf6dc52-248d-4a0a-b323-6c02b9626f81","deptCode":"001013","deptName":"铜陵市妇幼保健院（铜陵市第四人民医院）","director":null,"assetQuantity":0},{"deptId":"9c08e90b-0625-420b-8aa5-2315f90ab0f9","deptCode":"001014","deptName":"重庆市綦江区人民医院","director":null,"assetQuantity":0},{"deptId":"135ebe16-86f9-42e7-8ece-55a6e7d05c73","deptCode":"001015","deptName":"云南省老年病医院","director":null,"assetQuantity":0},{"deptId":"35281b2a-3cec-4090-af2c-fcf529d5461f","deptCode":"001016","deptName":"庐江县人民医院","director":null,"assetQuantity":0},{"deptId":"ec7c8562-e73e-4cb2-bbb2-335d69172f56","deptCode":"001017","deptName":"霍邱县第一人民医院","director":null,"assetQuantity":0},{"deptId":"8fe0f207-7aca-4648-b462-6e803295cd71","deptCode":"001018","deptName":"蚌埠市第三人民医院","director":null,"assetQuantity":0},{"deptId":"a4f86927-01c5-41c5-8393-881593c6b245","deptCode":"001019","deptName":"济南市第二人民医院","director":null,"assetQuantity":0},{"deptId":"1a98a13c-6c65-4a8a-a749-8c4d47f33de0","deptCode":"001020","deptName":"新平县总医院","director":null,"assetQuantity":0},{"deptId":"6126472e-f0b5-410e-8c02-d80cdae3e059","deptCode":"001021","deptName":"宿松县人民医院","director":null,"assetQuantity":0},{"deptId":"3f2dddaf-0621-44df-80dc-a9e07ca5812a","deptCode":"001022","deptName":"云南省肿瘤医院","director":null,"assetQuantity":0},{"deptId":"fec7c6f1-7445-4d54-bb4f-bba2504b54d4","deptCode":"001023","deptName":"普洱市人民医院","director":null,"assetQuantity":0}]

class Deptlist extends BaseNetModel{
  Deptlist({
      bool? success, 
      String? msg, 
      List<Response>? response,}){
    _success = success;
    _msg = msg;
    _response = response;
}

  Deptlist.fromJson(dynamic json) {
    _success = json['success'];
    _msg = json['msg'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _msg;
  List<Response>? _response;
Deptlist copyWith({  bool? success,
  String? msg,
  List<Response>? response,
}) => Deptlist(  success: success ?? _success,
  msg: msg ?? _msg,
  response: response ?? _response,
);
  bool? get success => _success;
  String? get msg => _msg;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['msg'] = _msg;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    // throw UnimplementedError();
    return Deptlist.fromJson(json);
  }

}

/// deptId : "03594f9f-d1ba-4198-9039-b795505dc2be"
/// deptCode : "001001"
/// deptName : "系统运维"
/// director : null
/// assetQuantity : 0

class Response {
  Response({
      String? deptId, 
      String? deptCode, 
      String? deptName, 
      dynamic director, 
      num? assetQuantity,}){
    _deptId = deptId;
    _deptCode = deptCode;
    _deptName = deptName;
    _director = director;
    _assetQuantity = assetQuantity;
}

  Response.fromJson(dynamic json) {
    _deptId = json['deptId'];
    _deptCode = json['deptCode'];
    _deptName = json['deptName'];
    _director = json['director'];
    _assetQuantity = json['assetQuantity'];
  }
  String? _deptId;
  String? _deptCode;
  String? _deptName;
  dynamic _director;
  num? _assetQuantity;
Response copyWith({  String? deptId,
  String? deptCode,
  String? deptName,
  dynamic director,
  num? assetQuantity,
}) => Response(  deptId: deptId ?? _deptId,
  deptCode: deptCode ?? _deptCode,
  deptName: deptName ?? _deptName,
  director: director ?? _director,
  assetQuantity: assetQuantity ?? _assetQuantity,
);
  String? get deptId => _deptId;
  String? get deptCode => _deptCode;
  String? get deptName => _deptName;
  dynamic get director => _director;
  num? get assetQuantity => _assetQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deptId'] = _deptId;
    map['deptCode'] = _deptCode;
    map['deptName'] = _deptName;
    map['director'] = _director;
    map['assetQuantity'] = _assetQuantity;
    return map;
  }

}