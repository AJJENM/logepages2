// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// import '../../utils/code_button.dart';
// import '../../utils/ty_color.dart';
//
// class textpage extends StatefulWidget {
//   const textpage({Key? key}) : super(key: key);
//
//   @override
//   State<textpage> createState() => _textpageState();
// }
// TextEditingController phoneEditor = TextEditingController();
// TextEditingController codeEditor = TextEditingController();
// int coldDownSeconds = 0;
// late Timer timer;
//
// class _textpageState extends State<textpage> {
//
//   coldDown() {
//     timer = Timer(Duration(seconds: 1), () {
//       setState(() {
//         --coldDownSeconds;
//       });
//
//       coldDown();
//     });
//   }
//
//   fetchSmsCode() async {
//     if (phoneEditor.text.length == 0) {
//       return;
//     }
//     // try {
//     //   await Request.post(
//     //     url: 'sms',
//     //     params: {'phone': phoneEditor.text, 'type': 'login'},
//     //   );
//       setState(() {
//         coldDownSeconds = 60;
//       });
//       coldDown();
//     }
//     // catch (e) {
//     //   Toast.show(e.toString());
//     // }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       // appBar: AppBar(title: Text('登录'), elevation: 0),
//       backgroundColor: Colors.white,
//       body: buildBody2(),
//     );
//   }
// }
// Widget buildPhone() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 8),
//     decoration: BoxDecoration(
//       color: TYColor.paper,
//       // borderRadius: BorderRadius.circular(5),
//         borderRadius: BorderRadius.all(Radius.circular(30))
//
//     ),
//     child: TextField(
//       controller: phoneEditor,
//       keyboardType: TextInputType.phone,
//       style: TextStyle(fontSize: 14, color: TYColor.darkGray),
//       decoration: InputDecoration(
//         hintText: '请输入手机号',
//         hintStyle: TextStyle(color: TYColor.gray),
//         border: InputBorder.none,
//         icon: Icon(Icons.account_box),
//       ),
//     ),
//   );
// }
//
// Widget buildCode() {
//   return Container(
//     padding: EdgeInsets.only(left: 8),
//     decoration: BoxDecoration(
//       color: TYColor.paper,
//       // borderRadius: BorderRadius.circular(5),
//         borderRadius: BorderRadius.all(Radius.circular(30))
//     ),
//     child: Row(
//       children: <Widget>[
//         Flexible(
//           child: TextField(
//             controller: codeEditor,
//             keyboardType: TextInputType.phone,
//             style: TextStyle(fontSize: 14, color: TYColor.darkGray),
//             decoration: InputDecoration(
//               hintText: '请输入短信验证码',
//               hintStyle: TextStyle(color: TYColor.gray),
//               border: InputBorder.none,
//               icon: Icon(Icons.email)
//             ),
//           ),
//         ),
//         Container(color: Color(0xffdae3f2), width: 1, height: 40),
//         CodeButton(
//           onPressed:
//           // fetchSmsCode,
//               (){
//
//                 debugPrint("${coldDownSeconds}");
//           },
//           coldDownSeconds: coldDownSeconds,
//         ),
//       ],
//     ),
//   );
//
// }
//
// Widget buildBody2() {
//   return Column(
//     children: <Widget>[
//       SizedBox(height: 20),
//       Container(
//         margin: EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             buildPhone(),
//             SizedBox(height: 10),
//             buildCode(),
//             SizedBox(height: 10),
//             SizedBox(height: 10),
//
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                Container(
//                child: Text.rich(
//                TextSpan(
//                children: [
//                TextSpan(
//                text: "密码登录", style: TextStyle(color: Color.fromARGB(255, 49, 183, 246)),
// //               设置点击事件
//                recognizer: TapGestureRecognizer()
//                ..onTap = () {
//                // debugPrint("${i++}");
//                },
//                ),
//                ],
//                ),
//                ),
//                ),
//
//               ],
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }