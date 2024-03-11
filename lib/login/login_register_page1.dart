import 'package:andand/login/login_code_connect.dart';
import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class LoginRegisterPage1 extends StatefulWidget {
  const LoginRegisterPage1({super.key});

  @override
  State<LoginRegisterPage1> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegisterPage1> {
  @override
  final TextEditingController _BirthdayController =
  TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    localizationsDelegates:
    [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
    supportedLocales:
    [
      const Locale('ko', 'KR'), // 한국어 지원
    ];
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final formKey = GlobalKey<FormState>();
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
        appBar: const LightAppBar(),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(margin: EdgeInsets.fromLTRB(0, screenHeight*0.03, 0, 0))
                            ,
                            CircleAvatar(
                              radius: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.065,
                              backgroundImage: const AssetImage(
                                  'assets/your_image.png'),
                            ),
                            SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.013,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      width: screenWidth * 0.9,
                      child: const Divider(color: LoginPage.mainColor)),
                  Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child:
                      loginText("회원가입을 진행해 주세요", color: LoginPage.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Column(
                    children: [
                      SizedBox(width: screenWidth * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(margin: const EdgeInsets.fromLTRB(
                                0, 5, 0, 5), child: const Text("아이디",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600))),
                            TextFormFieldCall(false, TextInputType.name,
                                TextInputAction.next, "", 20,
                                "아이디는 5자 이상입니다.",screenWidth),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(margin: const EdgeInsets.fromLTRB(
                                0, 45, 0, 5), child: const Text("비밀번호",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600))),
                            TextFormFieldComponent(false, TextInputType.phone,
                                TextInputAction.next, "", 11,
                                "비밀번호는 6자 이상입니다."),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: screenWidth * 0.8,
                    child: Container(alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: LoginPage.mainColor,
                          child: IconButton(onPressed: () {
                            Navigator.pushNamed(context, '/login_register');
                          },
                            icon: const Icon(
                              Icons.arrow_forward, color: Colors.white,),
                            iconSize: 30,),
                        )
                    ),),
                ],
              )
          ),
        )
    );
  }

  Widget TextFormFieldComponent(
      bool obscureText,
      TextInputType keyboardType,
      TextInputAction textInputAction,
      String hintText,
      maxSize,
      String errorMessage
      ) {
    return Container(decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xffADADAD),
              fontSize: 15,
              fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
        ),
        validator: (value) {
          if (value!.length < maxSize) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
  Container loginContainer_gray(String text, double screenWidth, {Color textColor = Colors.white, double fontSize = 17.0, FontWeight fontWeight = FontWeight.w500}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffADADAD),
        borderRadius: BorderRadius.circular(5),
      ),
      width: screenWidth * 0.20,
      height: 55,
      child: Center(
        child: loginText(text, color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
  Widget TextFormFieldCall(
      bool obscureText,
      TextInputType keyboardType,
      TextInputAction textInputAction,
      String hintText,
      int maxSize,
      String errorMessage,
      double screenWidth // screenWidth 추가
      ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: obscureText,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value!.length < maxSize) {
                  return errorMessage;
                }
                return null;
              },
            ),
          ),
          loginContainer_gray("아이디 중복 확인", screenWidth, textColor: Colors.black, fontSize: 11, fontWeight: FontWeight.w300)
        ],
      ),
    );
  }
}