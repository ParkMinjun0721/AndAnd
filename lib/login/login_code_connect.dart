import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import 'package:andand/widget/lightappbar.dart';

class LoginCodeConnect extends StatefulWidget {
  const LoginCodeConnect({super.key});

  @override
  State<LoginCodeConnect> createState() => _LoginCodeConnectState();
}

class _LoginCodeConnectState extends State<LoginCodeConnect> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String myCode = "wpm0ee5f2";
    // width: screenWidth * 0.9,
    // height: screenHeight * 0.6,
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
      appBar: const LightAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/bear_use_labtop.png',fit: BoxFit.contain, height: 188,),
              Column(
                children: [
                  Container(margin: const EdgeInsets.fromLTRB(0, 46, 0, 15), child:
                  loginText("나의 코드 복사", color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)
                  ),
                  Container(child:
                  GestureDetector(onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('클립보드에 복사되었습니다: $myCode'),
                      backgroundColor: LoginPage.mainColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                      ),
                    );
                  },child: loginText(myCode, color: Colors.black, fontSize: 23, fontWeight: FontWeight.normal, textDecoration: TextDecoration.underline))),
                ],
              ),
              Column(
                children: [
                  Container(margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: loginText("상대방 코드를 입력해주세요", fontSize: 15,)),
                  SizedBox(
                    width: screenWidth*0.8,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '코드 입력',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide.none),
                        hintStyle: const TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginContainer_green("연결하기", screenWidth),
                  loginContainer_white("나중에 연결하기", screenWidth)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Text loginText(String text, {Color color = Colors.black, double fontSize = 14.0, FontWeight fontWeight = FontWeight.normal, TextDecoration textDecoration = TextDecoration.none }) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDecoration,
    ),
  );
}

Container loginContainer_white(String text, double screenWidth, {Color textColor = Colors.black, double fontSize = 17.0, FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(style: BorderStyle.none),
    ),
    width: screenWidth * 0.8,
    height: 50,
    child: Center(
      child: loginText(text, color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    ),
  );
}
Container loginContainer_green(String text, double screenWidth, {Color textColor = Colors.white, double fontSize = 17.0, FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(
      color: LoginPage.mainColor,
      borderRadius: BorderRadius.circular(5),
    ),
    width: screenWidth * 0.8,
    height: 50,
    child: Center(
      child: loginText(text, color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    ),
  );
}
