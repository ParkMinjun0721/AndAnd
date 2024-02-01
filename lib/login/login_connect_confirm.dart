import 'package:andand/login/login_main.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:flutter/material.dart';
import 'package:andand/login/login_code_connect.dart';

class LoginConnectConfirm extends StatefulWidget {
  const LoginConnectConfirm({super.key});

  @override
  State<LoginConnectConfirm> createState() => _LoginConnectConfirmState();
}

class _LoginConnectConfirmState extends State<LoginConnectConfirm> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String name123 = "안하경";
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
      appBar: const LightAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/bear_use_labtop.png'),
                  ),
                  const SizedBox(height: 40),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginText(name123, fontSize: 20, fontWeight: FontWeight.bold, color: LoginPage.mainColor),
                      loginText(" 님과 연결하시겠습니까?", fontSize: 20, fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loginContainer_green("연결하기", screenWidth),
                loginContainer_white("취소", screenWidth)
              ],
            ),
          )
        ],
      ),

    );
  }
}
