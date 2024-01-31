import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import '../widget/lightappbar.dart';
import 'package:andand/login/login_code_connect.dart';


class LoginConnectComplete extends StatefulWidget {
  const LoginConnectComplete({super.key});

  @override
  State<LoginConnectComplete> createState() => _LoginConnectCompleteState();
}

class _LoginConnectCompleteState extends State<LoginConnectComplete> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String name1234 = "안하경";
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
      appBar: const LightAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/bear_welcome.png', fit: BoxFit.contain, height: 188,),
                  SizedBox(height: 40),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginText("환영합니다!", fontSize: 18, fontWeight: FontWeight.bold),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loginText(name1234, fontSize: 18, fontWeight: FontWeight.bold, color: LoginPage.mainColor),
                          loginText("님의 하루하루를 응원해요!", fontSize: 18, fontWeight: FontWeight.bold),
                        ],
                      ),
                  ],),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loginContainer_green("오늘 하루 시작하기", screenWidth),
              ],
            ),
          )
        ],
      ),
    );
  }
}
