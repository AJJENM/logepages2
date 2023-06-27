import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logepages2/global.dart';
import 'package:logepages2/pages/loginpage/Test.dart';
import 'package:logepages2/pages/loginpage/codepage.dart';
import 'package:logepages2/pages/loginpage/textpage.dart';
import 'package:logepages2/utils/http.dart';
import 'package:logepages2/utils/ty_color.dart';
import 'dart:async';
import "./pages/mainhome.dart";
import 'utils/code_button.dart';
import './pages/loginpage/Test.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'model/asset2.dart';
import 'model/banner_model.dart';
import 'model/collect_model.dart';
import 'model/user_model.dart';
import 'model/user_wrapper_model.dart';
import 'my_http_decoder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetOptions.instance
  // header
      .addHeaders({"Content-Type": 'application/json'})
  // baseUrl
      .setBaseUrl("https://hams.yunhuochong.com/")
  // 代理/https
  // .setHttpClientAdapter(IOHttpClientAdapter()
  //   ..onHttpClientCreate = (client) {
  //     client.findProxy = (uri) {
  //       return 'PROXY 192.168.20.43:8888';
  //     };
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     return client;
  //   })
  // cookie
      .addInterceptor(CookieManager(CookieJar()))
  // dio_http_cache
  // .addInterceptor(DioCacheManager(CacheConfig(
  //   baseUrl: "https://www.wanandroid.com/",
  // )).interceptor)
  // dio_cache_interceptor
      .addInterceptor(DioCacheInterceptor(
      options: CacheOptions(
        store: MemCacheStore(),
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 7),
        priority: CachePriority.normal,
        cipher: null,
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        allowPostMethod: false,
      )))
  //  全局解析器
  // .setHttpDecoder(MyHttpDecoder.getInstance())
  //  超时时间
      .setConnectTimeout(const Duration(milliseconds: 3000))
  // 允许打印log，默认未 true
      .enableLogger(true)
      .create();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // appBar: AppBar(
          //   // title: const Text("aAAAASADASDWD"),
          // ),
          body: (
              LoginScene()
          )),
     ),
  );
}
class LoginScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginSceneState();
}

class LoginSceneState extends State {



  // TextEditingController phoneEditor = TextEditingController();
  // TextEditingController codeEditor = TextEditingController();
  int coldDownSeconds = 0;
  late Timer timer;

  late int currentIndex;
  late PageController _controller;
  final List<Widget> _pages = [
    // codetext(),
    // textpage(),
    LoginPage(),
  ];

  // final GlobalKey<_LoginPageState> _key = GlobalKey();


  // fetchSmsCode() async {
  //   if (phoneEditor.text.length == 0) {
  //     return;
  //   }
  //   try {
  //     await Request.post(
  //       url: 'sms',
  //       params: {'phone': phoneEditor.text, 'type': 'login'},
  //     );
  //     setState(() {
  //       coldDownSeconds = 60;
  //     });
  //     coldDown();
  //   } catch (e) {
  //     Toast.show(e.toString());
  //   }
  // }

  // login() async {
  //   var phone = phoneEditor.text;
  //   var code = codeEditor.text;
  //
  //   try {
  //     var response = await Request.post(url: 'login', params: {
  //       'phone': phone,
  //       'code': code,
  //     });
  //     UserManager.instance.login(response);
  //
  //     Navigator.pop(context);
  //   } catch (e) {
  //     Toast.show(e.toString());
  //   }
  // }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  coldDown() {
    timer = Timer(Duration(seconds: 1), () {
      setState(() {
        --coldDownSeconds;
      });

      coldDown();
    });
  }
  @override
  void initState() {
    super.initState();
    // 初始化控制器
    // _controller = PageController();
  }



  Widget buildBody() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 100),

              SizedBox(
                height: 103,
                child: Image.asset('images/logo.png'),
              ),

              const SizedBox(
                height: 60,
                child: Text("云火虫—HAMS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 49, 183, 246),
                    fontWeight: FontWeight.bold
                  ))
              ),

              const SizedBox(
                  height: 50,
                  child: Text("医疗设备全生命周期管理系统",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 63, 83, 138),
                          // fontWeight: FontWeight.bold
                      ))
              ),
              Container(
                height: 240,
                width: 200,
                child: LoginPage(),
              ),
              // Container(
              //   height: 200,
              //   width: 200,
              //   child: PageView(
              //     controller: _controller,
              //     physics: const ClampingScrollPhysics(),
              //     onPageChanged: (currentIndex) {
              //       FocusScope.of(context).requestFocus(FocusNode());
              //       if (currentIndex == 0) {
              //         setState(() {
              //
              //         });
              //       } else if (currentIndex == 1) {
              //         setState(() {
              //
              //         });
              //       }
              //     },
              //     children: _pages,
              //   ),
              // ),


              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("忘记密码",
              //       textAlign: TextAlign.left,),
              //     Text("写在子页面厉去",
              //       textAlign: TextAlign.left,),
              //
              //   ],
              // ),
              
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     color: TYColor.white,
              //   ),
              //   height: 40,
              //
              //   child: ElevatedButton(
              //       style: ButtonStyle(
              //           shape: MaterialStateProperty.all(
              //               RoundedRectangleBorder(
              //                   borderRadius:
              //                   BorderRadius.circular(
              //                       20))),
              //       ),
              //       onPressed:
              //     // login,
              //     (){
              //       // requestGet1();
              //     //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              //     //   return GetData();
              //     // }));
              //       },
              //     child: const Text(
              //       '登录',
              //       style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 60,
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Text("版权所有@云火虫(成都)智慧医疗科技有限公司",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold
                        ))
                ),
              )

            ],
          ),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('登录'), elevation: 0),

      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }
}
