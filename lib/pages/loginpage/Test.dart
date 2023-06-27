import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nb_net/src/base_net_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logepages2/model/deptlist.dart';
import 'package:logepages2/utils/ToastUtils.dart';

import '../../model/asset2.dart';
import '../../model/asset2.dart';
import '../../utils/code_button.dart';
import '../../utils/http.dart';
import '../../utils/ty_color.dart';

import 'dart:convert' as convert;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late PageController _pageController;
  // 当前子项索引
  int currentIndex = 0;
  late List<Widget> _pages;
  TextEditingController phoneEditor = TextEditingController();
  TextEditingController codeEditor = TextEditingController();
  TextEditingController textEditor = TextEditingController();

  int coldDownSeconds = 62;
  late Timer timer;

  bool _obscureTextPhone = true;
  bool _obscureTextEmail = true;

  bool _obscureTextLogin = true;

  TextEditingController loginEmailAddrController = TextEditingController();
  TextEditingController loginEmailPwdController = TextEditingController();
  TextEditingController loginPhoneNumbController = TextEditingController();
  TextEditingController loginPhoneCodeController = TextEditingController();

  final FocusNode focusNodePhoneNumber = FocusNode();
  final FocusNode focusNodePhoneCode = FocusNode();

  final FocusNode focusNodeEmailAddr = FocusNode();
  final FocusNode focusNodeEmailPwd = FocusNode();
  final FocusNode focusNodeName = FocusNode();


  static const Color loginGradientStart = const Color(0xFFfbab66);
  static const Color loginGradientEnd = const Color(0xFFf7418c);


  Color left = Colors.black;
  Color right = Colors.white;

  coldDown() {
    timer = Timer(Duration(seconds: 1), () {
      setState(() {
        --coldDownSeconds;
      });
      coldDown();
    });
  }

  // fetchSmsCode() async {
  //   if (phoneEditor.text.length == 0) {
  //     return;
  //   }
  //   // try {
  //   //   await Request.post(
  //   //     url: 'sms',
  //   //     params: {'phone': phoneEditor.text, 'type': 'login'},
  //   //   );
  //   setState(() {
  //     coldDownSeconds = 60;
  //   });
  //   coldDown();
  // }

  @override
  void initState() {
    super.initState();
    _pages = [
      buildBody(context),
      buildBody2(context)
      // LoginPage(),
    ];
    _pageController = PageController();
  }

  @override
  void dispose() {
    focusNodeEmailAddr.dispose();
    focusNodeEmailPwd.dispose();
    focusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: buildlogin()
    );
  }
  Widget buildlogin() {
    return Column(children: [
      Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: PageView(
                controller: _pageController,
                physics:  const NeverScrollableScrollPhysics(),
                onPageChanged: (i) {
                  currentIndex = i;
                  if (i == 0) {
                    setState(() {

                    });
                  } else {
                    setState(() {

                    });
                  }
                },
                children: _pages,
              ),
            ),

            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                color: TYColor.white,
              ),
              height: 40,
              width: MediaQuery.of(context).size.width - 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(20))),
                ),
                onPressed:
                // login,
                    (){
                      requestGet1("api/cockpit/dept/list/phone?mobilePhone=${phoneEditor.text.toString()}");
                      // var a  = Deptlist.response.deptId;

                      // Deptlist a = a.fromJson(convert.jsonDecode(source))
                      // debugPrint("${a}");
                      if (currentIndex == 0){
                    // requestGet1(phoneEditor.text);
                  }
                  else if (currentIndex == 1){
                  }
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  //   return GetData();
                  // }));
                },
                child: const Text(
                  '登录',
                  style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      )
    ],);
  }

  Widget buildPhone() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: TYColor.paper,
          // borderRadius: BorderRadius.circular(5),
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: TextField(
        controller: phoneEditor,
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 14, color: TYColor.darkGray),
        decoration: InputDecoration(
          hintText: '请输入手机号',
          hintStyle: TextStyle(color: TYColor.gray),
          border: InputBorder.none,
          icon: Icon(Icons.account_box),
        ),
      ),
    );
  }

  Widget buildCode() {
    return Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: TYColor.paper,
          // borderRadius: BorderRadius.circular(5),
          borderRadius: BorderRadius.all(Radius.circular(30))

      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              obscureText: true,
              controller: codeEditor,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 14, color: TYColor.darkGray),
              decoration: InputDecoration(
                  hintText: '请输入密码',
                  hintStyle: TextStyle(color: TYColor.gray),
                  border: InputBorder.none,
                  icon: Icon(Icons.lock)
              ),
            ),
          ),
          // Container(color: Color(0xffdae3f2), width: 1, height: 40),
          // CodeButton(
          //   onPressed:
          //   // fetchSmsCode,
          //       (){
          //
          //   },
          //   coldDownSeconds: coldDownSeconds,
          // ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildPhone(),
              SizedBox(height: 10),
              buildCode(),
              SizedBox(height: 10),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "忘记密码",
                            style: TextStyle(color: Color.fromARGB(
                                255, 49, 183, 246)),
                            //设置点击事件
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              ToastUtils.shotToast("请联系管理员");
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "验证码登录",
                            style: TextStyle(color: Color.fromARGB(
                                255, 49, 183, 246)),
                            //设置点击事件
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState() {}
                                _pageController.jumpToPage(currentIndex + 1);
                                debugPrint("${phoneEditor.text}");
                                debugPrint("${currentIndex}");
                              },
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        )
      ],
    );
  }


  Widget buildPhone2() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: TYColor.paper,
          // borderRadius: BorderRadius.circular(5),
          borderRadius: BorderRadius.all(Radius.circular(30))

      ),
      child: TextField(
        controller: phoneEditor,
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 14, color: TYColor.darkGray),
        decoration: InputDecoration(
          hintText: '请输入手机号',
          hintStyle: TextStyle(color: TYColor.gray),
          border: InputBorder.none,
          icon: Icon(Icons.account_box),
        ),
      ),
    );
  }

  Widget buildCode2() {
    return Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: TYColor.paper,
          // borderRadius: BorderRadius.circular(5),
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: textEditor,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 14, color: TYColor.darkGray),
              decoration: InputDecoration(
                  hintText: '请输入短信验证码',
                  hintStyle: TextStyle(color: TYColor.gray),
                  border: InputBorder.none,
                  icon: Icon(Icons.email)
              ),
            ),
          ),
          Container(color: Color(0xffdae3f2), width: 1, height: 40),
          CodeButton(
            onPressed:
            // fetchSmsCode,
                () {
                    if (phoneEditor.text.length == 0) {
    return ToastUtils.shotToast("请输入手机号");
    }
                    else{
                      // requestPost();
                      ToastUtils.shotToast("验证码已发送");
    setState(() {
                        coldDownSeconds = 60;
    });
                      coldDown();
                  }},
            coldDownSeconds: coldDownSeconds,
          ),
        ],
      ),
    );
  }

  Widget buildBody2(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildPhone2(),
              SizedBox(height: 10),
              buildCode2(),
              SizedBox(height: 10),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "密码登录", style: TextStyle(color: Color
                              .fromARGB(255, 49, 183, 246)),
//               设置点击事件
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _pageController.jumpToPage(currentIndex - 1);
                                debugPrint("${currentIndex}");
                                // debugPrint("${i++}");
                              },
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        )
      ],
    );

  }

  void _onPhoneCodeBtnPress() {
    _pageController.animateToPage(
      currentIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.decelerate,);
  }

  void _onAccPwdBtnPress() {
    _pageController?.animateToPage(
      currentIndex - 1, duration: Duration(milliseconds: 500), curve: Curves.decelerate,);
  }

  void _togglePhoneLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleEmailLogin() {
    setState(() {
      _obscureTextEmail = !_obscureTextEmail;
    });
  }
}