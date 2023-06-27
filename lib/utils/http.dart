import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:logepages2/model/deptlist.dart';

import '../model/asset2.dart';
import '../model/banner_model.dart';
import '../model/collect_model.dart';
import '../model/user_model.dart';
import '../model/user_wrapper_model.dart';
import '../my_http_decoder.dart';

/// Get 请求原始数据
void requestGet(String a) async {
  var appResponse = await get("$a");
  appResponse.when(success: (dynamic) {
    // var size = model.data?.length;
    debugPrint("成功返回$dynamic");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });
}

/// Get 请求原始数据
void requestGet2222(String a) async {
  var appResponse = await get("$a");
  appResponse.when(success: (model) {
    // var size = model.data?.length;
    debugPrint("成功返回$model");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });

}


/// Get 请求数据，不带泛型
void requestGet1(String a,) async {
  var appResponse = await get("${a}", decodeType: Deptlist());
  appResponse.when(success: (model) {
    var size = model.response;
    var a = model.response;
    debugPrint("不带泛型成功返回$a条");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });
}

/// Get 请求数据，完整的泛型
void requestGet2() async {
  var appResponse = await get<BannerModel, BannerModel>("banner/json",
      decodeType: BannerModel());
  appResponse.when(success: (model) {
    var size = model.data?.length;
    debugPrint("成功返回$size条");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });
}

/// Post 请求
void requestPost() async {
  var appResponse = await post<UserWrapperModel, UserWrapperModel>(
      "user/login",
      decodeType: UserWrapperModel(),
      queryParameters: {"username": '你的账号', "password": '你的密码'});
  appResponse.when(success: (UserWrapperModel model) {
    var nickname = model.data?.nickname;
    debugPrint("成功返回nickname=$nickname");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });
}

/// 自定义Decoder的 Post 请求
void requestCustomDecoderPost() async {
  var appResponse = await post<UserModel, UserModel>("user/login",
      decodeType: UserModel(),
      httpDecode: MyHttpDecoder.getInstance(),
      queryParameters: {"username": '', "password": ''});
  appResponse.when(success: (UserModel model) {
    var nickname = model.nickname;
    debugPrint("成功返回nickname=$nickname");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });
}

/// 自定义Decoder的 Get 请求
void requestCustomGet() async {
  var appResponse = await get<BannerBean, List<BannerBean>>("banner/json",
      decodeType: BannerBean(),
      httpDecode: MyHttpDecoder.getInstance());
  appResponse.when(success: (List<BannerBean> model) {
    var size = model.length;
    debugPrint("成功返回$size条");
  }, failure: (String msg, int code) {
    debugPrint("失败了：$msg");
  });
}

/// 自定保存和携带 cookie 的请求
void requestCookieGet() async {
  var appResponse = await get<CollectModel, CollectModel>(
      "lg/collect/list/0/json",
      decodeType: CollectModel(),
      httpDecode: MyHttpDecoder.getInstance());
  appResponse.when(success: (CollectModel model) {
    var size = model.datas?.length;
    debugPrint("成功返回$size条");
  }, failure: (String msg, int code) {
    debugPrint("失败了：$msg");
  });
}

/// 带缓存的 Get 请求
void requestCacheGet() async {
  var appResponse = await get<BannerModel, BannerModel>("banner/json",
      options: buildCacheOptions(const Duration(days: 7)),
      decodeType: BannerModel());
  appResponse.when(success: (BannerModel model) {
    var size = model.data?.length;
    debugPrint("成功返回$size条");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });
}

/// 通过回调解析返回的请求
void requestCallBack() async {
  var appResponse = await get<BannerModel, List<BannerBean>>("banner/json",
      options: buildCacheOptions(const Duration(days: 7)),
      decodeType: BannerModel(), converter: (response) {
        var errorCode = response.data['errorCode'];

        /// 请求成功
        if (errorCode == 0) {
          var data = response.data['data'];
          var dataList = List<BannerBean>.from(
              data.map((item) => BannerBean.fromJson(item)).toList());
          return Result.success(dataList);
        } else {
          var errorMsg = response.data['errorMsg'];
          return Result.failure(msg: errorMsg, code: errorCode);
        }
      });
  appResponse.when(success: (List<BannerBean> model) {
    debugPrint("成功返回${model.length}条");
  }, failure: (String msg, int code) {
    debugPrint("失败了：msg=$msg/code=$code");
  });
}