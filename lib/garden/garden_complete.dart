import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import '../widget/lightappbar.dart';
import 'package:andand/login/login_code_connect.dart';


class Garden_complete extends StatefulWidget {
  const Garden_complete({super.key});

  @override
  State<Garden_complete> createState() => _Garden_CompleteState();
}

class _Garden_CompleteState extends State<Garden_complete> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
      appBar: const BaseAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/garden_complete.png', fit: BoxFit.contain, height: 188,),
                  SizedBox(height: 40),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginText("환영합니다!", fontSize: 18, fontWeight: FontWeight.bold),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loginText("안하경", fontSize: 18, fontWeight: FontWeight.bold),
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

void main() {
  runApp(MaterialApp(
    home: Garden_complete(),
  ));
}
